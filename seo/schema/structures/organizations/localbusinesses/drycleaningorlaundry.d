/**
* Copyright © DiamondMVC 2019
* License: MIT (https://github.com/DiamondMVC/Diamond/blob/master/LICENSE)
* Author: Jacob Jensen (bausshf)
*/
module diamond.seo.schema.structures.organizations.localbusinesses.drycleaningorlaundry;

import diamond.core.apptype;

static if (isWeb)
{
  import diamond.seo.schema.structures.organizations.localbusiness;

  /// http://schema.org/DryCleaningOrLaundry
  final class DryCleaningOrLaundry : LocalBusiness
  {
    private:


    public:
    final:
    /// Creates a new dry cleaning or laundry.
    this()
    {
      super("DryCleaningOrLaundry");
    }

    @property
    {
    }
  }
}
