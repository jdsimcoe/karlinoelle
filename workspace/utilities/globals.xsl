<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform">


<!-- WRITING
     ======== -->


<xsl:template match="/data/writing-latest/entry">
  <xsl:call-template name="writing-entry"/>
</xsl:template>


<xsl:template match="/data/writing-single/entry">
  <xsl:call-template name="writing-entry"/>
</xsl:template>

<xsl:template match="/data/writing-all/entry">
  <xsl:call-template name="writing-grid-entry"/>
</xsl:template>


<xsl:template name="writing-entry">
  <div>
    <xsl:choose>
      <xsl:when test="$root-page = 'home' or $root-page = 'error'">
        <xsl:attribute name="class">
          <xsl:text>wrapper-blog home</xsl:text>
        </xsl:attribute>
      </xsl:when>
      <xsl:otherwise>
        <xsl:attribute name="class">
          <xsl:text>wrapper-blog</xsl:text>
        </xsl:attribute>
      </xsl:otherwise>
    </xsl:choose>
    <div class="span12 article entry list">

      <h5 class="center">From the Desk of Brian Simcoe</h5>
      <hr/>
      <div class="inner">
        <h4 class="right">
          <xsl:call-template name="format-date">
            <xsl:with-param name="date" select="date/date/start/@iso" />
            <xsl:with-param name="format" select="'%m+; '" />
          </xsl:call-template>
          <xsl:call-template name="format-date">
            <xsl:with-param name="date" select="date/date/start/@iso" />
            <xsl:with-param name="format" select="'%d;'" />
          </xsl:call-template>
          <sup>
            <xsl:call-template name="format-date">
              <xsl:with-param name="date" select="date/date/start/@iso" />
              <xsl:with-param name="format" select="'%ds;'" />
            </xsl:call-template>
          </sup>
          <xsl:call-template name="format-date">
            <xsl:with-param name="date" select="date/date/start/@iso" />
            <xsl:with-param name="format" select="', %y+;'" />
          </xsl:call-template>
        </h4>
        <h1>
          <a href="{$root}/writing/{title/@handle}">
            <xsl:value-of select="title" />
          </a>
        </h1>
        <div class="content">
          <xsl:for-each select="verses/item">
            <xsl:call-template name="verse-entry" />
          </xsl:for-each>
          <xsl:choose>
            <xsl:when test="$root-page = 'home' or $root-page = 'error'">
              <p>
                <xsl:call-template name="truncate">
                  <xsl:with-param name="node" select="content" />
                  <xsl:with-param name="length" select="200" />
                </xsl:call-template>
              </p>
              <p class="right">
                <a href="{$root}/writing/{title/@handle}">Read <strong>Full Article </strong> <strong>&#8594;</strong></a>
              </p>
            </xsl:when>
            <xsl:otherwise>

              <xsl:value-of select="content" disable-output-escaping="yes" />

            </xsl:otherwise>
          </xsl:choose>
        </div>
      </div>
    </div>


  </div>
</xsl:template>

<xsl:template name="writing-grid-entry">
  <div class="span6 wrapper-blog grid">
    <div class="article entry list single">

      <h5 class="center">
        <xsl:call-template name="format-date">
          <xsl:with-param name="date" select="date/date/start/@iso" />
          <xsl:with-param name="format" select="'%m+; '" />
        </xsl:call-template>
        <xsl:call-template name="format-date">
          <xsl:with-param name="date" select="date/date/start/@iso" />
          <xsl:with-param name="format" select="'%d;'" />
        </xsl:call-template>
        <sup>
          <xsl:call-template name="format-date">
            <xsl:with-param name="date" select="date/date/start/@iso" />
            <xsl:with-param name="format" select="'%ds;'" />
          </xsl:call-template>
        </sup>
        <xsl:call-template name="format-date">
          <xsl:with-param name="date" select="date/date/start/@iso" />
          <xsl:with-param name="format" select="', %y+;'" />
        </xsl:call-template>
      </h5>
      <hr/>
      <div class="inner">
        <h1>
          <a href="{$root}/writing/{title/@handle}">
            <xsl:value-of select="title" />
          </a>
        </h1>
        <div class="content">

          <xsl:call-template name="truncate">
            <xsl:with-param name="node" select="content" />
            <xsl:with-param name="length" select="200" />
          </xsl:call-template>
          <p class="right">
            <a href="{$root}/writing/{title/@handle}">Read <strong>&#8594;</strong></a>
          </p>

        </div>
      </div>
    </div>


  </div>
</xsl:template>


<!-- ARTWORK
     ======= -->


<xsl:template match="/data/artwork-3-latest/entry">
  <xsl:call-template name="artwork-entry"/>
</xsl:template>


<xsl:template name="artwork-entry">

  <div class="span4 artwork">
    <a href="{$root}/artwork/{title/@handle}" class="artwork-entry home">
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
          <xsl:if test="price != ''">
            <span class="badge number">
              <xsl:text>$</xsl:text>
              <xsl:value-of select="price"/>
              <xsl:text>.</xsl:text>
              <sup>00</sup>
            </span>
          </xsl:if>
        </p>

      </div>
      <img class="img-artwork" src="/workspace/img/spacer.gif" alt="{image/item/image/caption}" style="width:100%; height:200px;">
        <xsl:attribute name="data-responsimage">
          <xsl:value-of select="image/item/image/filename" />
        </xsl:attribute>
      </img>


    </a>
  </div>

</xsl:template>


<xsl:template match="/data/artwork-featured/entry">
  <xsl:call-template name="artwork-featured-entry"/>
</xsl:template>


<xsl:template name="artwork-featured-entry">
  <div class="span12">
    <div class="artwork">
      <a href="{$root}/artwork/{title/@handle}" class="artwork-entry home featured">
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
            <xsl:if test="price != ''">
              <span class="badge number">
                <xsl:text>$</xsl:text>
                <xsl:value-of select="price"/>
                <xsl:text>.</xsl:text>
                <sup>00</sup>
              </span>
            </xsl:if>
          </p>

        </div>
        <div class="featured">Featured</div>
        <img class="img-artwork" src="/workspace/img/spacer.gif" alt="{image/item/image/caption}" style="width:100%; height:550px;">
          <xsl:attribute name="data-responsimage">
            <xsl:value-of select="image/item/image/filename" />
          </xsl:attribute>
        </img>


      </a>
    </div>
  </div>

</xsl:template>



<!-- PHOTOGRAPHY
     =========== -->

<xsl:template match="/data/photo-4-latest/entry">
  <xsl:call-template name="photo-entry"/>
</xsl:template>


<xsl:template name="photo-entry">

  <div class="span3 photo">
    <a href="{$root}/photo/{title/@handle}" class="photo-entry home">
      <div class="metadata">
        <h4>
          <xsl:value-of select="title" />
        </h4>
        <p class="description">
          <em><xsl:value-of select="image/item/caption"/></em>
        </p>
      </div>
      <img class="img-polaroid" src="/workspace/img/spacer.gif" alt="{image/item/caption}" style="width:199px; height:199px;">
        <xsl:attribute name="data-responsimage">
          <xsl:value-of select="image/item/image/filename" />
        </xsl:attribute>
      </img>


    </a>
  </div>

</xsl:template>


<!-- VERSES
     ====== -->


<xsl:template name="verse-entry">
  <div class="verse center">
    <blockquote>
      <xsl:value-of select="content" />
      <br />
      <cite>
        <xsl:value-of select="passage" />
        <xsl:text> (</xsl:text>
        <xsl:value-of select="version/item/abbreviation" />
        <xsl:text>)</xsl:text>
      </cite>
    </blockquote>
  </div>
</xsl:template>


</xsl:stylesheet>
