<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform">


<xsl:include href="../utilities/master.xsl"/>
<xsl:include href="../utilities/globals.xsl"/>


<xsl:template match="data">


  <div class="main container">


    <div class="row">
      <div class="span12">
        <h3 class="section-header art">Featured</h3>
      </div>
    </div>

    <div class="row">
      <div id="frontCarousel" class="carousel slide">
        <div class="carousel-inner">
          <xsl:apply-templates select="/data/photo-featured/entry"/>
        </div>
        <a class="left carousel-control" href="#frontCarousel" data-slide="prev">&lt;</a>
        <a class="right carousel-control" href="#frontCarousel" data-slide="next">&gt;</a>
      </div>
    </div>


    <div class="row">
      <div class="span12">
        <h3 class="section-header photo">Categories</h3>
      </div>
      <xsl:apply-templates select="/data/category-all/entry"/>
    </div>

    <div class="row">
      <div class="span12">
        <h3 class="section-header photo">From the Blog</h3>
      </div>
      <xsl:apply-templates select="/data/blog-latest/entry"/>
      <div class="span12">
        <p class="pull-right post-link"><a href="/blog">See all posts &#8594;</a></p>
      </div>
    </div>

  </div>

</xsl:template>


</xsl:stylesheet>