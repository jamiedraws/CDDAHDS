// observers
import { observer } from "Shared/ts/observers/intersection";

// utils
import {
    convertFragmentToHTMLElement,
    renderTemplate
} from "Shared/ts/utils/html";

class PartialView extends HTMLElement {
    public url?: string;

    public request?: boolean;

    constructor() {
        super();
    }

    private static async renderViewByContext(
        context: PartialView
    ): Promise<void> {
        if (!context.url) return;
        if (!context.request) return;

        const request = await fetch(context.url);
        const response = await request.text();

        const element = convertFragmentToHTMLElement(renderTemplate(response));
        if (!element) return;

        context.innerHTML = "";
        context.append(element);
    }

    static get observedAttributes() {
        return ["request", "url"];
    }

    public connectedCallback(): void {}

    public attributeChangedCallback(
        name: string,
        oldValue: string,
        newValue: string
    ): void {
        switch (name) {
            case "request":
                this.request = /true/.test(newValue);
                PartialView.renderViewByContext(this);
                break;
            case "url":
                this.url = newValue;
                PartialView.renderViewByContext(this);
                break;
        }
    }
}

export const initializePartialView = (): void => {
    customElements.define("partial-view", PartialView);
};

export const initializePartialViewControllersByObserver = (): void => {
    observer("[data-partial-view-id]", {
        inRange: (controller) => {
            const id = controller.getAttribute("data-partial-view-id");
            if (!id) return;

            const view = document.querySelector<PartialView>(
                `partial-view#${id}[request="false"]`
            );
            if (!view) return;

            view.setAttribute("request", "true");
        }
    });
};
