# Architecture Overview

This project is a modular **game architecture kit** for Godot — designed to give developers the benefits of dependency injection, reactive programming, and clean separation of concerns **without sacrificing editor support**.

At its core, it enables **editor-driven composition** while remaining **runtime-scalable**, by using a small set of primitives that play well with Godot’s scenes and resources.

---

## ✨ Core Principles

- **Inspector-Based Dependency Injection**  
  All references are editor-exposed. No manual wiring at runtime. Just drag, drop, and play.

- **Composable Architecture**  
  Systems are loosely coupled through runtime-safe primitives like `ResourceVariables` and `GameEvents`. You define dependencies declaratively, not procedurally.

- **Editor-Driven, Runtime-Scalable**  
  Designed to be easily edited in the Godot editor while staying fast, testable, and reliable at runtime.

- **Clean and Predictable Side Effects**  
  Logging, resetting, and signal-handling are handled in consistent, testable ways.

---

## 🧩 Key Concepts

### `ResourceVariable<T>`
A data wrapper for primitive types (e.g., int, float, bool) that allows multiple components to **observe and respond to changes** without tightly coupling them. It behaves like a signal-emitting variable.

- Keeps the editor as the source of truth
- Supports runtime reset
- Type-specific variants (`IntResourceVariable`, etc.) due to GDScript limitations

### `GameEvent`
A scriptable event that can be emitted from anywhere, and connected to via the editor. Think: Unity’s `ScriptableObject` events but with actual testability.

### `Logger`
A pluggable, injectable logger resource. Defaults to printing, but you can swap it for your own structured logger, debugger tool, or remote console.

### `ResourceResetter`
Optional node that resets all `ResourceVariables` on game start. Encourages the practice of storing them in organized folders for discoverability.

---

## 🛠 Example Use Case

- A `HealthBar` node listens to a `HealthResourceVariable`
- An `Enemy` damages the player by changing that resource’s value
- A `GameEvent` fires when health drops to zero
- A `Logger` prints that event, or your custom logger sends it to Sentry

No hard references. All connections are editor-defined.

---

## 🔮 Vision

This kit isn’t just a helper — it’s a **foundation**.  
It lets you build systems that are modular, editor-exposed, and runtime-resilient, with patterns that scale as your game grows.

The architecture is *gameplay-agnostic* and designed to evolve with your project — not box it in.
