// components
import Carousel from "Shared/ts/components/carousel";
import Accordion from "Shared/ts/components/accordion";

// adapters
import SlideCarouselAdapter from "Shared/ts/api/carousel/slide/adapters/slide-carousel";

// observers
import { observer } from "Shared/ts/observers/intersection";

// utils
import Disclosure from "Shared/ts/utils/disclosure";

// applications
import {
    initializeBase,
    initializeMicrosite
} from "Shared/ts/applications/template";
import { validatePromoCodeAroundStatusScreen } from "Shared/ts/applications/form";
import { initializeValidateCommon } from "Shared/ts/applications/form";
import { initializeNavById } from "Shared/ts/applications/navigation";
import { initializeDocumentModalDialogsByTemplates } from "Shared/ts/applications/modal-dialog";
import {
    initializePartialView,
    initializePartialViewControllersByObserver
} from "ts/utils/partial-view";
import { initializeOrderForm } from "ts/applications/form";
import StatusScreen from "Shared/ts/components/status-screen";
import AmazonCoupon, {
    IAmazonCouponPacket,
    initializeAmazonCouponComponent
} from "Shared/ts/components/amazon-coupon";

declare function handleCartChange(productCode: string, quantity: number): any;

initializeBase();
initializeMicrosite();

initializeOrderForm();
validatePromoCodeAroundStatusScreen();

initializeDocumentModalDialogsByTemplates();

initializePartialView();
initializePartialViewControllersByObserver();

const initializeCheckoutForm = (): void => {
    const validateCommon = initializeValidateCommon();
    if (!validateCommon.form) return;

    const statusScreen = new StatusScreen("checkout-form", validateCommon.form);
    statusScreen.update("Verifying payment options");

    let closeConnection = false;
    let timeout: NodeJS.Timeout;

    const initializeTimeout = (time: number) =>
        setTimeout(() => {
            closeConnection = true;

            clearTimeout(timeout);

            statusScreen.update("Ready for use");
        }, time);

    addEventListener("load", (event) => initializeTimeout(0));
};

initializeCheckoutForm();

observer(".slide--carousel", {
    inRange: (element) => {
        const carousel = new Carousel(new SlideCarouselAdapter(element));

        carousel.enablePrevNextControls();
    }
});

observer(".accordion", {
    inRange: (element) => new Accordion(element)
});

const disclosure = new Disclosure();

disclosure.controllers.forEach((controller) => {
    controller.addEventListener("click", (event) => {
        disclosure.toggleElementsByController(controller);
    });
});

const runTaskByThrottle = <T extends () => void>(
    task: T,
    milliseconds: number = 100
): void => {
    let timer;
    if (timer) return;

    timer = setTimeout(() => {
        timer = undefined;
        task();
    }, milliseconds);
};

const initializeScrollingNav = (nav: HTMLElement): void => {
    observer("[data-nav-tracker]", {
        outRange: (element) => {
            runTaskByThrottle(() => {
                nav.classList.add("nav--is-minibar");
            });
        },
        inRange: (element) => {
            runTaskByThrottle(() => {
                nav.classList.remove("nav--is-minibar");
            });
        },
        unObserve: false
    });
};

const initializeNav = (): void => {
    const nav = initializeNavById("nav");
    if (!nav) return;

    if (!nav.root) return;

    initializeScrollingNav(nav.root);
};

initializeNav();
initializeAmazonCouponComponent();

const amazonCoupons = Array.from(
    document.querySelectorAll<AmazonCoupon>("amazon-coupon")
);

amazonCoupons.forEach((amazonCoupon) => {
    amazonCoupon.addEventListener(
        "activate-checkbox",
        (event: CustomEvent<IAmazonCouponPacket>) => {
            if(typeof(handleCartChange) === 'function')
            {
                handleCartChange(event.detail.productCode, 1);
            }
        }
    );
});
