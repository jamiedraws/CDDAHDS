// api
import ValidateCommon from "Shared/ts/api/validate/validate-common";

// applications
import {
    initializeExpressCheckout,
    initializeValidateCommonWithBraintree
} from "Shared/ts/applications/form";

// interfaces
import { ICartChange } from "Shared/ts/interfaces/cart-change";
import { IValidateCommonErrorResponse } from "Shared/ts/interfaces/validate/validate-common";

// utils
import { ValidateControlTarget } from "Shared/ts/utils/validate";

export const validateControlByAddToCartButtons = (
    fieldset: HTMLElement | null,
    controlTarget: ValidateControlTarget | null,
    validateCommon: ValidateCommon
) => {
    if (!fieldset || !controlTarget) return;

    validateCommon.controlTargets.push(controlTarget);

    const button = fieldset.querySelector("[data-code-toggle]");
    if (!button) return;

    let activate = false;

    button.addEventListener(
        "click",
        (event) => {
            activate = true;
        },
        {
            once: true
        }
    );

    window.addEventListener("CartChange", (event: CustomEvent<ICartChange>) => {
        if (!activate) return;

        validateCommon.validateControlTarget(controlTarget, () =>
            event.detail.items.some((item) => item.type === "MainOffer")
        );
    });
};

export const initializeOrderForm = (): void => {
    const form = document.querySelector<HTMLFormElement>(".order form");
    if (!form) return;

    const validateCommon = initializeValidateCommonWithBraintree(form);
    if (!validateCommon) return;

    const errorResponseRepository = new WeakMap<
        ValidateControlTarget,
        IValidateCommonErrorResponse
    >();

    const handleErrors = (): Promise<IValidateCommonErrorResponse> => {
        return new Promise<IValidateCommonErrorResponse>((resolve, reject) => {
            const offersTarget = validateCommon.controlTargets.find(
                (target) => target.id === "offers-error-anchor"
            );
            if (!offersTarget) {
                return reject();
            }

            const offersMessage = document.querySelector(
                "#offers-error-message"
            );
            if (!offersMessage) return reject();

            const response = {
                element: $(offersTarget as HTMLElement),
                message:
                    offersMessage.textContent?.trim() ??
                    "Please select a product"
            };

            errorResponseRepository.set(offersTarget, response);

            resolve(response);
        });
    };

    window._dtmShoppingCart.ScrollToErrors = (): void => {};

    const alertReference = window._dtm.alert;

    window._dtm.alert = (data, $target, cb) => {
        handleErrors()
            .then((response) => {
                const controlTarget = response.element.get(0);
                if (!controlTarget) return;

                const isValid = !/product/gi.test(data);

                validateCommon.validateControlTarget(
                    controlTarget,
                    () => isValid
                );

                if (!isValid) {
                    validateCommon.setFocusOnInvalidControl();
                }
            })
            .finally(() => {
                alertReference(data, $target);
                if (!$target) return;

                const target = $target.get(0);
                if (!target) return;

                target.setAttribute("tabindex", "-1");
                target.focus();
            });
    };

    const addErrorsReference = window._dtmShoppingCart.AddErrors;

    window._dtmShoppingCart.AddErrors = (errors: string[]): void => {
        const offersError = errors.find((error) => error.match(/product/gi));
        if (!offersError) return;

        handleErrors()
            .then((response) => {
                errors.splice(errors.indexOf(offersError), 1, response.message);
            })
            .finally(() => {
                addErrorsReference(errors);
            });
    };

    window.onFormPreValidation = (event) => {
        const errors: IValidateCommonErrorResponse[] = [];

        const isEmpty = window._dtmShoppingCart.Items().length === 0;
        if (!isEmpty) return errors;

        const offersTarget = validateCommon.controlTargets.find(
            (target) => target.id === "offers-error-anchor"
        );
        if (!offersTarget) return errors;

        const response = errorResponseRepository.get(offersTarget);
        if (!response) return errors;

        errors.push(response);
        return errors;
    };

    initializeExpressCheckout(form);

    const fieldset = form.querySelector<HTMLFieldSetElement>("#SelectOffer");
    if (!fieldset) return;

    const control = fieldset.querySelector<ValidateControlTarget>(
        "#offers-error-anchor"
    );
    if (!control) return;

    validateControlByAddToCartButtons(fieldset, control, validateCommon);
};
