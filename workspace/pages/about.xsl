<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform">


<xsl:include href="../utilities/master.xsl"/>


<xsl:variable name="title">
  <xsl:text>About</xsl:text>
</xsl:variable>

<xsl:template match="data">
  <div class="wrapper-about">
    <div class="container">
      <div class="marketing">
        <i class="glyphicon-heart icon-large"></i>
        <h2>Who is Brian Simcoe?</h2>
        <p class="marketing-byline">Here is a brief but poignant history of Brian's life:</p>
      </div>
      <div class="wrapper-doctrine">
        <div class="entry">

          <div class="content">
            <h2>One</h2>
            <p>Integer posuere erat a ante venenatis dapibus posuere velit aliquet. Nullam id dolor id nibh ultricies vehicula ut id elit. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.</p>
            <h2>Two</h2>
            <p>Integer posuere erat a ante venenatis dapibus posuere velit aliquet. Nullam id dolor id nibh ultricies vehicula ut id elit. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.</p>
            <h2>Three</h2>
            <p>Integer posuere erat a ante venenatis dapibus posuere velit aliquet. Nullam id dolor id nibh ultricies vehicula ut id elit. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.</p>
            <h2>Four</h2>
            <p>Integer posuere erat a ante venenatis dapibus posuere velit aliquet. Nullam id dolor id nibh ultricies vehicula ut id elit. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.</p>
            <hr/>
          </div>
        </div>

        <div class="marketing">
          <p class="marketing-byline">Feel free to contact him for more info! Ciao!</p>
        </div>


      </div>
    </div>
  </div>
</xsl:template>


</xsl:stylesheet>