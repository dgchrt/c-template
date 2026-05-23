/**
 * @file object.h
 * @brief Object convenience and lifecycle API.
 */

#ifndef OBJECT_H
#define OBJECT_H
#include <stddef.h>

/**
 * @brief Allocates a reference-counted object by byte size.
 * @param size_bytes Number of bytes to allocate for the object payload.
 * @return void* Reference to the allocated object, or NULL on failure.
 */
void *(object_alloc_bytes)(size_t size_bytes);

/**
 * @brief Allocates a reference-counted object for a type.
 * @param Type Type to allocate.
 * @details Use as: Point *point = object_alloc(Point);
 */
#define object_alloc(Type) ((Type *)(object_alloc_bytes)(sizeof(Type)))

/**
 * @brief Increments the reference count of an object.
 * @param reference Reference to the object.
 * @return void* The same reference passed in (or NULL if input is NULL).
 */
void *object_retain(void *reference);

/**
 * @brief Decrements the reference count and frees the object on zero.
 * @param reference Reference to the object.
 */
void object_release(void *reference);

/**
 * @brief Calls a function using the reference as first argument.
 * @details Example: object_call(point_reference, point_init, x, y)
 */
#define object_call(reference, function, ...) function((reference), __VA_ARGS__)

#endif /* OBJECT_H */
