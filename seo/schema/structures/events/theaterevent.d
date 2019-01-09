/**
* Copyright © DiamondMVC 2019
* License: MIT (https://github.com/DiamondMVC/Diamond/blob/master/LICENSE)
* Author: Jacob Jensen (bausshf)
*/
module diamond.seo.schema.structures.events.theaterevent;

import diamond.core.apptype;

static if (isWeb)
{
  import diamond.seo.schema.structures.event;

  /// http://schema.org/TheaterEvent
  final class TheaterEvent : Event
  {
    private:


    public:
    final:
    /// Creates a new theather event.
    this()
    {
      super("TheaterEvent");
    }

    @property
    {
    }
  }
}
