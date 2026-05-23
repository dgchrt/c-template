/* Object implementation details. Public API documentation lives in object.h. */

#include "object.h"
#include <stddef.h>
#include <stdlib.h>

typedef struct {
  size_t reference_count;
} ObjectHeader;

/* Internal helper: recover object header from an object reference. */
static ObjectHeader *_object_header_from_reference(void *reference) {
  return ((ObjectHeader *)reference) - 1;
}

void *(object_alloc_bytes)(size_t size_bytes) {
  ObjectHeader *object_header = malloc(sizeof(ObjectHeader) + size_bytes);

  if (object_header == NULL) {
    return NULL;
  }

  object_header->reference_count = 1;
  return (void *)(object_header + 1);
}

void *object_retain(void *reference) {
  if (reference == NULL) {
    return NULL;
  }

  ObjectHeader *object_header = _object_header_from_reference(reference);
  object_header->reference_count += 1;
  return reference;
}

void object_release(void *reference) {
  if (reference == NULL) {
    return;
  }

  ObjectHeader *object_header = _object_header_from_reference(reference);

  if (object_header->reference_count > 1) {
    object_header->reference_count -= 1;
    return;
  }

  free(object_header);
}
