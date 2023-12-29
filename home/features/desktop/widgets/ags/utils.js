export const range = (length, start = 1) => 
  Array.from({ length }, (_, i) => i + start)

export const substitute = (collection, item) => 
  collection.find(([from]) => from === item)?.[1] || item

export const createSurfaceFromWidget = (widget) => {
  const alloc = widget.get_allocation()
  const surface = new cairo.ImageSurface(
    cairo.Format.ARGB32,
    alloc.width,
    alloc.height,
  )
  const cr = new cairo.Context(surface)
  cr.setSourceRGBA(255, 255, 255, 0)
  cr.rectangle(0, 0, alloc.width, alloc.height)
  cr.fill()
  widget.draw(cr)

  return surface
}
