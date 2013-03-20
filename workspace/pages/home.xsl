<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform">


<xsl:include href="../utilities/master.xsl"/>
<xsl:include href="../utilities/globals.xsl"/>


<xsl:template match="data">


  <div class="main container">


    <div class="row">
      <div class="span12">
        <h3 class="section-header art">Artwork</h3>
      </div>
    </div>

    <div class="row">
      <xsl:apply-templates select="/data/artwork-featured/entry"/>
    </div>

    <div class="row">
      <xsl:apply-templates select="/data/artwork-3-latest/entry[position() &lt; 4]"/>
    </div>

    <div class="row">
      <div class="span12">
        <h3 class="section-header photo">Photography</h3>
      </div>
      <xsl:apply-templates select="/data/photo-4-latest/entry"/>
    </div>

    <div class="row">
      <div class="span10 offset1">
        <xsl:apply-templates select="/data/writing-latest/entry"/>
      </div>
    </div>

  </div>

</xsl:template>


</xsl:stylesheet>