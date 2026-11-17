# Presentation Patterns — MVC, MVP, MVVM

These patterns organize the **user interface** side of an application. They are complementary to domain-centric architectures (Clean/Hexagonal), which protect the domain; these patterns structure how the UI interacts with the rest of the system.

## MVC — Model-View-Controller

- **Model** — data and business state.
- **View** — visual representation.
- **Controller** — receives user input, updates the model, and selects the view.

Classic pattern for web frameworks. The controller tends to become a coordinator.

## MVP — Model-View-Presenter

- **View** is more passive and is driven by the Presenter.
- **Presenter** contains the UI logic and talks to the Model.
- Improves testability of UI logic compared with classic MVC because the Presenter can be tested without the real view.

Common in desktop and some mobile architectures.

## MVVM — Model-View-ViewModel

- **ViewModel** exposes data and commands that the View binds to.
- Strong data-binding is typical (especially in XAML, WPF, modern front-end frameworks).
- The View is declarative; the ViewModel holds presentation state and logic.

Popular in modern client-side and cross-platform UI frameworks.

## Philosophy

All three aim to separate presentation concerns from domain/business logic so that:
- UI can change without rewriting business rules.
- UI logic can be tested more easily.
- Responsibilities stay clearer.

In a Clean/Hexagonal system these patterns usually live in the outermost layer (Interface Adapters / Primary Adapters). The Presenter/ViewModel/Controller talks to Application Use Cases, not directly to the domain model or infrastructure.
