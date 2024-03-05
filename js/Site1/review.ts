// applications
import { initializeValidateEvent } from "Shared/ts/applications/form";

// utils
import { getJSONByElementAttribute } from "Shared/ts/utils/html";
import ValidateEvent from "Shared/ts/utils/validate-event";

// components
import StatusScreen from "Shared/ts/components/status-screen";

// controls
import SurveyController, {
    ISurveyDataContext
} from "Shared/js/template/controls/survey-popup/utils/survey-controller";

interface IValidateReviewFormController {
    form: HTMLFormElement;
    reset: () => void;
}

const context = <ISurveyDataContext>(
    getJSONByElementAttribute(document.currentScript, "data-context")
);

const getValidatEventInputsByIds = (
    ids: string[],
    validateEvent: ValidateEvent
): HTMLInputElement[] => {
    const lowerIds = ids.map((id) => id.toLowerCase());

    return validateEvent.inputs.reduce((previous, current) => {
        if (lowerIds.includes(current.id.toLowerCase())) {
            return [...previous, current];
        }

        return [...previous];
    }, <HTMLInputElement[]>[]);
};

const validateOptionalInputRules = (
    control: HTMLInputElement,
    validateEvent: ValidateEvent
): void => {
    const target = validateEvent.getTargetByControl(control);

    if (control.value === "") {
        control.removeAttribute("required");
        validateEvent.setControlToDefault(target);

        return;
    }

    control.setAttribute("required", "true");
    validateEvent.validateControl(control);
};

const validateReviewForm = (
    form: HTMLFormElement,
    submit: HTMLButtonElement,
    callback: (controller: IValidateReviewFormController) => void
): void => {
    const validateEvent = initializeValidateEvent(form, submit, "required");

    const optionalInputs = getValidatEventInputsByIds(
        ["email", "firstname", "lastname"],
        validateEvent
    );

    optionalInputs.forEach((input) => {
        input.addEventListener("change", (event) =>
            validateOptionalInputRules(input, validateEvent)
        );
    });

    const controller: IValidateReviewFormController = {
        form,
        reset() {
            form.reset();
            optionalInputs.forEach((input) =>
                validateOptionalInputRules(input, validateEvent)
            );
        }
    };

    submit.addEventListener("click", (event) => {
        event.preventDefault();

        validateEvent.validateAll();

        if (validateEvent.isValidForm()) {
            callback(controller);
        }
    });
};

const initialize = (): void => {
    const container = document.querySelector<HTMLFormElement>(
        "#product-review-form-group"
    );
    if (!container) return;

    const submit = container.querySelector<HTMLButtonElement>("#submit");
    if (!submit) return;

    const statusScreen = new StatusScreen("product-review-form", container);

    new SurveyController(context, async (submitSurvey) => {
        validateReviewForm(
            container as HTMLFormElement,
            submit as HTMLButtonElement,
            async (controller) => {
                statusScreen.busy("Submitting review...");

                await submitSurvey(controller.form);

                statusScreen.done("Thank you for your feedback!");

                controller.reset();
            }
        );
    });
};

initialize();
