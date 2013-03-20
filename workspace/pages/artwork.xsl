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
            <h3 class="section-header art">Browse the Gallery</h3>
            <xsl:apply-templates select="/data/artwork-all/entry"/>
          </div>

          <div class="row">
            <div class="span12">
              <xsl:call-template name="cd-pagination">
                <xsl:with-param name="pagination" select="/data/artwork-all/pagination" />
                <xsl:with-param name="pagination-url" select="'/artwork/$'" />
              </xsl:call-template>
            </div>
          </div>

        </xsl:when>
        <xsl:otherwise>
          <div class="row">
            <div class="span12">
              <xsl:apply-templates select="/data/artwork-single/entry"/>
            </div>
          </div>
        </xsl:otherwise>
      </xsl:choose>

    </div>

</xsl:template>


<xsl:template match="/data/artwork-all/entry">
   <div class="span3 artwork">
    <a href="{$root}/artwork/{title/@handle}">
      <xsl:attribute name="class">
        <xsl:choose>
          <xsl:when test="featured = 'Yes'">
            <xsl:text>artwork-entry home featured</xsl:text>
          </xsl:when>
          <xsl:otherwise>
            <xsl:text>artwork-entry home</xsl:text>
          </xsl:otherwise>
        </xsl:choose>
      </xsl:attribute>
      <div class="metadata">
        <h4>
          <xsl:value-of select="title" />
        </h4>
        <p>
          <xsl:value-of select="media"/>
          <xsl:if test="medium != ''">
            <xsl:text> on </xsl:text>
            <xsl:value-of select="medium"/>
          </xsl:if>
          <br/>
          <span class="dimensions">
            <xsl:text>Dimensions:</xsl:text>
            <xsl:value-of select="dimensions"/>
          </span>
<!--           <xsl:if test="price != ''">
            <span class="badge number">
              <xsl:text>$</xsl:text>
              <xsl:value-of select="price"/>
              <xsl:text>.</xsl:text>
              <sup>00</sup>
            </span>
          </xsl:if> -->
        </p>

      </div>
      <xsl:if test="featured = 'Yes'">
        <div class="featured small">Featured</div>
      </xsl:if>
      <img class="img-artwork" src="/workspace/img/spacer.gif" alt="{image/item/image/caption}" style="width:100%; height:160px;">
        <xsl:attribute name="data-responsimage">
          <xsl:value-of select="image/item/image/filename" />
        </xsl:attribute>
      </img>


    </a>
  </div>
</xsl:template>


<xsl:template match="/data/artwork-single/entry">
  <div class="artwork">
    <h3 class="section-header art">
      <xsl:value-of select="title"/>
    </h3>
    <div class="row">
      <div class="span12">
        <img class="img-artwork" src="/workspace/img/spacer.gif" alt="{image/item/image/caption}" style="width:100%; height:600px;">
          <xsl:attribute name="data-responsimage">
            <xsl:value-of select="image/item/image/filename" />
          </xsl:attribute>
        </img>
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
          <h4 class="top"><xsl:value-of select="title"/></h4>
          <p>
            <xsl:value-of select="media"/>
            <xsl:if test="medium != ''">
              <xsl:text> on </xsl:text>
              <xsl:value-of select="medium"/>
            </xsl:if>
          </p>
          <p>
            <xsl:value-of select="dimensions"/>
          </p>
          <xsl:if test="price != ''">
            <p class="price">
              <span class="badge number">
                <xsl:text>$</xsl:text>
                <xsl:value-of select="price"/>
                <xsl:text>.</xsl:text>
                <sup>00</sup>
              </span>
            </p>
          </xsl:if>
        </div>
      </div>
    </div>
  </div>
<!--   <hr/>
  <h5 class="other">Latest Artwork</h5>
  <div class="row">
    <xsl:apply-templates select="//data/artwork-all/entry[position() &lt; 5 and @id != //data/artwork-single/entry/@id]"/>
  </div> -->
</xsl:template>



</xsl:stylesheet>