package problems

import "core:fmt"

import "core:mem"


SHOW_LEAK :: false
TEST_MODE :: true


p01 :: proc() {



}

mantain :: proc() {

  // fmt.println("Hello World")

  p01()

  return
}

main :: proc() {

  when SHOW_LEAK {
    track: mem.Tracking_Allocator
    mem.tracking_allocator_init(&track, context.allocator)
    context.allocator = mem.tracking_allocator(&track)
  }

  when !TEST_MODE {
    mantain()
  } else {

    fmt.println("no test of leaks")
  }

  when SHOW_LEAK {
    for _, leak in track.allocation_map {
      fmt.printf("%v leaked %v bytes\n", leak.location, leak.size)
    }
    for bad_free in track.bad_free_array {
      fmt.printf(
        "%v allocation %p was freed badly\n",
        bad_free.location,
        bad_free.memory,
      )
    }
  }

  return
}
