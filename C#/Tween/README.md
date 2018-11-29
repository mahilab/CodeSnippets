# Tween

**Author(s):**

Evan Pezent

**Description:**

C# Implementation of common [easing/tweening functions](https://easings.net/). These are particularly useful for creating smooth animations and transitions in Unity Engine when used in conjunction with the built-in `Lerp` functions.

**Usage:**

Consider the following coroutine which animates an object's position:

```csharp
IEnumerator MyAnimation() {
    Vector3 start = transform.position;
    Vector3 end   = new Vector3(10,10,10);
    float duration     = 10;
    float elapsedTime  = 0;
    while (elapsedTime <= duration) {
        // Compute percent complete [0 1)
        float t = elapsedTime / duration;
        // Compute a new t value using preferred Tween function [0 1)
        float t_prime = Tween.Exponential.In(0, 1, t);
        // Use Unity's Lerp function on t_prime instead of t
        transform.position = Vector3.Lerp(start, end, t_prime);
        // Increment time and yield control
        elapsedTime += Time.deltaTime;
        yield return null;
    }
    transform.position = end;
}
```
