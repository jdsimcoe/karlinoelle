<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform">


<xsl:include href="../utilities/master.xsl"/>
<xsl:include href="../utilities/globals.xsl"/>
<xsl:include href="../utilities/pagination.xsl"/>


<xsl:template match="data">

    <div class="container wrapper">

      <xsl:choose>
        <xsl:when test="$title = '' or number($title)">

          <div class="row">
            <xsl:call-template name="photo-grid"/>
          </div>

          <div class="row">
            <div class="span12">
              <xsl:call-template name="cd-pagination">
                <xsl:with-param name="pagination" select="/data/photo-all/pagination" />
                <xsl:with-param name="pagination-url" select="'/photo/$'" />
              </xsl:call-template>
            </div>
          </div>

        </xsl:when>
        <xsl:when test="$title = 'category'">
          <div class="row">
            <h3 class="section-header photo">
              <xsl:value-of select="$category"/>
            </h3>
            <xsl:apply-templates select="/data/photo-all/entry[category/item/@id = //category-all/entry[title/@handle = $category]/@id]"/>
          </div>
        </xsl:when>
        <xsl:otherwise>
          <div class="row">
            <div class="span12">
              <xsl:apply-templates select="/data/photo-single/entry"/>
            </div>
          </div>
        </xsl:otherwise>
      </xsl:choose>

    </div>

</xsl:template>

<xsl:template name="photo-grid">

  <xsl:for-each select="//data/category-all/entry">
    <xsl:variable name="catid" select="@id"/>

    <h3 class="section-header photo">
      <xsl:value-of select="title"/>
    </h3>
<!--     <h5>
      <xsl:value-of select="description"/>
    </h5> -->
    <xsl:for-each select="//photo-all/entry[category/item/@id = $catid]">
      <img class="img-polaroid" src="/workspace/img/spacer.gif" alt="{image/item/caption}" style="width:240px; height:240px;">
        <xsl:attribute name="data-responsimage">
          <xsl:value-of select="image/item/image/filename" />
        </xsl:attribute>
      </img>
    </xsl:for-each>
  </xsl:for-each>

</xsl:template>


<xsl:template match="/data/photo-all/entry">
   <div class="span3 photo">
    <a href="{$root}/photo/{title/@handle}" class="photo-entry home">
      <div class="metadata">
        <h4>
          <xsl:value-of select="title" />
        </h4>
        <p class="description">
          <em><xsl:value-of select="image/item/caption" /></em>
        </p>
      </div>
      <img class="img-polaroid" src="/workspace/img/spacer.gif" alt="{image/item/caption}" style="width:240px; height:240px;">
        <xsl:attribute name="data-responsimage">
          <xsl:value-of select="image/item/image/filename" />
        </xsl:attribute>
      </img>

    </a>
  </div>
</xsl:template>


<xsl:template match="/data/photo-single/entry">
  <div class="photography">
    <h3 class="section-header photo">
      <xsl:value-of select="title"/>
    </h3>
    <div class="row">
      <div class="span12">
        <img class="img-polaroid" src="/workspace/img/spacer.gif" alt="{image/item/caption}" style="width:100%; height:100%;">
          <xsl:attribute name="data-responsimage">
            <xsl:value-of select="image/item/image/filename" />
          </xsl:attribute>
        </img>
        <h4 class="caption">
          <em><xsl:value-of select="image/item/caption"/></em>
        </h4>
      </div>
    </div>
    <div class="row">
      <div class="span9">
        <div class="content">
          <h4 class="top">Description</h4>
          <xsl:value-of select="description" disable-output-escaping="yes" />
        </div>
      </div>
      <div class="span3">
        <div class="content">
          <h4 class="top">EXIF</h4>
          <p>
            <strong>Focal Length: </strong>
            <xsl:value-of select="//photo-info/image-info/image/exif/section[@name = 'EXIF']/data[@tag = 'FocalLengthIn35mmFilm']" disable-output-escaping="yes" />
            <xsl:text> mm</xsl:text>
          </p>
          <p>
            <strong>Aperture: </strong>
            <xsl:value-of select="//photo-info/image-info/image/exif/section[@name = 'COMPUTED']/data[@tag = 'ApertureFNumber']" disable-output-escaping="yes" />
          </p>
          <p>
            <strong>ISO: </strong>
            <xsl:value-of select="//photo-info/image-info/image/exif/section[@name = 'EXIF']/data[@tag = 'ISOSpeedRatings']" disable-output-escaping="yes" />
          </p>
          <p>
            <strong>Dimensions: </strong>
            <xsl:value-of select="//photo-info/image-info/image/exif/section[@name = 'COMPUTED']/data[@tag = 'Width']" disable-output-escaping="yes" />
            <xsl:text> x </xsl:text>
            <xsl:value-of select="//photo-info/image-info/image/exif/section[@name = 'COMPUTED']/data[@tag = 'Height']" disable-output-escaping="yes" />
          </p>
          <p>
            <strong>Camera: </strong>
            <xsl:value-of select="//photo-info/image-info/image/exif/section[@name = 'IFD0']/data[@tag = 'Make']" disable-output-escaping="yes" />
            <xsl:text> </xsl:text>
            <xsl:value-of select="//photo-info/image-info/image/exif/section[@name = 'IFD0']/data[@tag = 'Model']" disable-output-escaping="yes" />
          </p>
        </div>
      </div>

    </div>
  </div>
<!--   <hr/>
  <h5 class="other">Latest Photography</h5>
  <div class="row">
    <xsl:apply-templates select="/data/photo-all/entry[position() &lt; 6 and @id != //data/photo-single/entry/@id]"/>
  </div> -->
</xsl:template>

</xsl:stylesheet>