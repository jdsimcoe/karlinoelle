<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:output method="xml"
  doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN"
  doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"
  omit-xml-declaration="yes"
  encoding="UTF-8"
  indent="yes" />

<xsl:include href="../utilities/master.xsl"/>
<xsl:include href="../utilities/globals.xsl"/>

<xsl:variable name="title">
  <xsl:text>Error</xsl:text>
</xsl:variable>

<xsl:template match="data">

  <div class="main container">

    <div class="marketing">
      <h2>We're sorry you didn't find what you were looking for. Use this as a chance to browse around!</h2>
    </div>


    <hr class="soften"/>

    <div class="row">
      <div class="span12">
        <h3 class="section-header art">Artwork</h3>
      </div>
    </div>

    <div class="row">
      <xsl:apply-templates select="/data/artwork-3-latest/entry"/>
    </div>

    <div class="row">
      <div class="span12">
        <h3 class="section-header photo">Photography</h3>
      </div>
      <xsl:apply-templates select="/data/photo-4-latest/entry"/>
    </div>

    <div class="row">
      <div class="span12">
        <xsl:apply-templates select="/data/writing-latest/entry"/>
      </div>
    </div>

  </div>

</xsl:template>




</xsl:stylesheet>