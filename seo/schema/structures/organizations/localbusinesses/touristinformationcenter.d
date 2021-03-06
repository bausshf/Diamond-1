/**
* Copyright © DiamondMVC 2019
* License: MIT (https://github.com/DiamondMVC/Diamond/blob/master/LICENSE)
* Author: Jacob Jensen (bausshf)
*/
module diamond.seo.schema.structures.organizations.localbusinesses.touristinformationcenter;

import diamond.core.apptype;

static if (isWeb)
{
  import diamond.seo.schema.structures.organizations.localbusiness;

  /// http://schema.org/TouristInformationCenter
  final class TouristInformationCenter : LocalBusiness
  {
    private:


    public:
    final:
    /// Creates a new tourist information center.
    this()
    {
      super("TouristInformationCenter");
    }

    @property
    {
    }
  }
}
