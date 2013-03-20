<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform">


<xsl:include href="../utilities/master.xsl"/>
<xsl:include href="../utilities/globals.xsl"/>
<xsl:include href="../utilities/pagination.xsl"/>


<xsl:template match="data">

    <div class="container">

      <xsl:choose>
        <xsl:when test="$title = '' or number($title)">

          <div class="row">
            <div class="span12">
              <xsl:apply-templates select="/data/writing-all/entry"/>

              <xsl:call-template name="cd-pagination">
                <xsl:with-param name="pagination" select="/data/writing-all/pagination" />
                <xsl:with-param name="pagination-url" select="'/writing/$'" />
              </xsl:call-template>

            </div>
          </div>
        </xsl:when>
        <xsl:otherwise>
          <div class="row">
            <div class="span12">
              <xsl:apply-templates select="/data/writing-single/entry"/>
            </div>
          </div>
        </xsl:otherwise>
      </xsl:choose>

    </div>

</xsl:template>


<!-- <xsl:template match="/data/writing-single/entry">
  <div class="article entry">
    <h4 class="center">
      <xsl:call-template name="format-date">
        <xsl:with-param name="date" select="date/date/start/@iso" />
        <xsl:with-param name="format" select="'%m-; %d;, %y+;'" />
      </xsl:call-template>
      <xsl:call-template name="edit-entry">
        <xsl:with-param name="component" select="'articles'"/>
      </xsl:call-template>
    </h4>
    <h1 class="center">
      <a href="{$root}/{$root-page}/{title/@handle}">
        <xsl:value-of select="title" />
      </a>
    </h1>
    <hr class="soften" />
    <xsl:if test="image != ''">
      <img class="img-polaroid" src="/workspace/img/spacer.gif" alt="{image/item/image/caption}">
        <xsl:attribute name="data-responsimage">
          <xsl:value-of select="image/item/image/filename" />
        </xsl:attribute>
      </img>
    </xsl:if>
    <div class="content">
      <xsl:for-each select="verses/item">
        <xsl:call-template name="verse-entry" />
      </xsl:for-each>
      <xsl:value-of select="content" disable-output-escaping="yes" />
    </div>
  </div>
  <hr class="soften" />
  <a href="{$root}/{$root-page}" class="btn btn-primary btn-large">
    <xsl:text>&#8592; Back to the </xsl:text>
    <strong>
      <xsl:value-of select="$page-title" />
    </strong>
  </a>
</xsl:template> -->



</xsl:stylesheet>