<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:include href="toolkit.xsl"/>
<xsl:include href="date-time-advanced.xsl" />

<xsl:output method="xml"
    doctype-public="XSLT-compat"
    doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"
    omit-xml-declaration="yes"
    encoding="UTF-8"
    indent="yes" />


<xsl:param name="cookie-username" />

<xsl:template match="/">

  <html lang="en">
  <head>
    <xsl:choose>
      <xsl:when test="$page-title = 'Home'">
        <title><xsl:value-of select="$website-name"/></title>
      </xsl:when>
      <xsl:otherwise>
        <title>
          <xsl:if test="$title != ''">
            <xsl:variable name="title-spaced">
              <xsl:choose>
                <xsl:when test="number($title)">
                  <xsl:text>Page </xsl:text>
                  <xsl:value-of select="$title" />
                </xsl:when>
                <xsl:otherwise>
                  <xsl:call-template name="string-replace-all">
                    <xsl:with-param name="text" select="$title" />
                    <xsl:with-param name="replace" select="'-'" />
                    <xsl:with-param name="by" select="' '" />
                  </xsl:call-template>
                </xsl:otherwise>
              </xsl:choose>
            </xsl:variable>
            <xsl:call-template name="TitleCase">
              <xsl:with-param name="text" select="translate(normalize-space($title-spaced),
          'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')" />
            </xsl:call-template>
            <xsl:text> | </xsl:text>
          </xsl:if>
          <xsl:value-of select="$website-name"/>
          <xsl:text> | </xsl:text>
          <xsl:value-of select="//data/page-data/entry/title" />
        </title>
      </xsl:otherwise>
    </xsl:choose>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta name="description" content="The artwork, photography, and writing portfolio of Brian Simcoe." />
    <meta name="keywords" content="Brian Simcoe, art, photography, writing" />
    <meta name="author" content="Brian Simcoe" />
    <meta name="responsimage" data-server="{$root}/image/2/width/height/anchor/0/uploads/images/filename" data-static="{$workspace}/img/spacer.gif" data-loading="{$workspace}/img/loading.gif" />

    <link href="{$workspace}/css/briansimcoe.1.0.2.css" rel="stylesheet" />
    <link href="{$workspace}/img/favicon.ico" rel="shortcut icon" type="image/x-icon" />
    <link rel="apple-touch-icon-precomposed" href="{$workspace}/img/apple-touch-icon-precomposed.png" />

    <script type="text/javascript">
      <xsl:comment>
        var _gaq=[["_setAccount","UA-38166333-1"],["_trackPageview"]];
        (function(d,t){
          var g=d.createElement(t), s=d.getElementsByTagName(t)[0];
          g.async=1;
            g.src=("https:"==location.protocol?"//ssl":"//www")+".google-analytics.com/ga.js";
            s.parentNode.insertBefore(g,s)
        }(document,"script"));
      </xsl:comment>
    </script>
  </head>

  <body class="page-{$root-page}">
    <xsl:apply-templates select="data/navigation"/>
    <div>
      <xsl:if test="$page-title != 'Home'">
        <xsl:attribute name="class">
          <xsl:text>jumbotron subhead</xsl:text>
        </xsl:attribute>
        <div class="page-headers">
          <div class="container">
            <h1>
              <a>
                <xsl:attribute name="href">
                  <xsl:choose>
                    <xsl:when test="$root-page = 'error'">
                      <xsl:value-of select="$root" />
                    </xsl:when>
                    <xsl:otherwise>
                      <xsl:value-of select="$root" />
                      <xsl:text>/</xsl:text>
                      <xsl:value-of select="$root-page" />
                    </xsl:otherwise>
                  </xsl:choose>
                </xsl:attribute>

                <xsl:value-of select="//data/page-data/entry/title" />

              </a>
            </h1>
<!--             <p class="lead">
              <xsl:value-of select="//data/page-data/entry/description" />
            </p> -->
          </div>
        </div>
      </xsl:if>
      <xsl:if test="$page-title = 'Home'">
        <xsl:attribute name="class">
          <xsl:text>jumbotron masthead</xsl:text>
        </xsl:attribute>
        <div class="container">
          <div>
            <h2 class="brand">Karli Noelle Photography</h2>
          </div>
          <p class="vision">
            <em>The artistic <span class="amp">&amp;</span> creative portfolio of Brian Simcoe</em>
          </p>
        </div>
      </xsl:if>
    </div>

    <div id="content">

      <xsl:apply-templates />

    </div>

    <footer class="footer">
      <div class="container">
        <div class="row">
          <div class="span2">
            <a href="{root}" class="brand">BS:<span>C</span></a>
            <ul class="nav nav-list">
              <xsl:apply-templates select="data/navigation/page"/>
            </ul>
          </div>
          <div class="span6">
            <h5>A Blurb</h5>
            <p class="lead">Donec ullamcorper nulla non metus auctor fringilla. Duis mollis, est non commodo luctus, nisi erat porttitor ligula, eget lacinia odio sem nec elit. Sed posuere consectetur est at lobortis.</p>
          </div>
          <div class="span4">
            <h5>Contact Brian</h5>
          </div>
        </div>
        <hr class="special"/>
        <p class="center copyright">
          <xsl:text>&#xa9;&#160;</xsl:text>
          <xsl:value-of select="$this-year" />
          <xsl:text>.&#160;</xsl:text>
          <xsl:value-of select="$website-name"/>
          <xsl:text>. All rights reserved.&#160;|&#160;</xsl:text>
          <a href="{$root}/rss/" class="rss badge">RSS</a>
        </p>
      </div>
    </footer>

    <script type="text/javascript">
    <xsl:comment>
    (function (window) {
      'use strict';
      function downloadJSAtOnload() {
        var js = {
          "scripts":[
            "/workspace/js/briansimcoe.1.0.2.js"
          ]
        };
        for (var key in js.scripts) {
          if (js.scripts[key]) {
            var element=document.createElement("script");
            element.src=js.scripts[key];
            document.body.appendChild(element);
          }
        }
      }
      if(window.addEventListener) {
        window.addEventListener("load",downloadJSAtOnload,false);
      } else if (window.attachEvent) {
        window.attachEvent("onload",downloadJSAtOnload);
      } else {
        window.onload=downloadJSAtOnload;
      }
    }(window));
    //</xsl:comment>
    </script>
  </body>

</html>

</xsl:template>

<xsl:template match="navigation">
  <div class="navbar navbar-inverse navbar-fixed-top">
    <div class="container">
      <button type="button" class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="brand pull-left" href="/"><strong>b</strong></a>
      <div class="nav-collapse collapse">
        <ul class="nav pull-right">
          <xsl:apply-templates select="page"/>
          <xsl:if test="$cookie-username">
            <li class="">
              <a href="#" data-toggle="dropdown" class="dropdown"><i class="glyphicon-wrench"></i></a>
              <ul class="dropdown-menu">
                <li><a href="/symphony/" target="_blank">Symphony</a></li>
                <li><a href="?debug" target="_blank">Debug</a></li>
                <li><a href="{$root}/symphony/logout/">Logout</a></li>
              </ul>
            </li>
          </xsl:if>
        </ul>
      </div>
    </div>
  </div>
</xsl:template>

<xsl:template match="navigation/page">
  <xsl:if test="not(types/type = 'hidden' or types/type = 'XML')">
    <li>
      <xsl:attribute name="class">
        <xsl:choose>
          <xsl:when test="@handle = $current-page">
            <xsl:text>active</xsl:text>
            <xsl:if test="@handle = 'home'">
              <xsl:text> hidden-desktop</xsl:text>
            </xsl:if>
          </xsl:when>
          <xsl:when test="@handle = 'home'">
            <xsl:text>hidden-desktop</xsl:text>
          </xsl:when>
          <xsl:otherwise></xsl:otherwise>
        </xsl:choose>
      </xsl:attribute>
      <a>
        <xsl:choose>
          <xsl:when test="types/type = 'index'">
            <xsl:attribute name="href"><xsl:value-of select="$root"/>/</xsl:attribute>
          </xsl:when>
          <xsl:otherwise>
            <xsl:attribute name="href"><xsl:value-of select="$root"/>/<xsl:value-of select="@handle"/></xsl:attribute>
          </xsl:otherwise>
        </xsl:choose>
        <xsl:choose>
          <xsl:when test="@handle = 'foundations'">
            <xsl:value-of select="name"/>
            <xsl:text>&#160;&#160;</xsl:text>
            <xsl:if test="/data/studies-upcoming/entry != ''">
              <span class="badge">
                <xsl:call-template name="format-date">
                  <xsl:with-param name="date" select="/data/studies-upcoming/entry/date/date/start/@iso" />
                  <xsl:with-param name="format" select="'%m-; %d;, %y+;'" />
                </xsl:call-template>
              </span>
            </xsl:if>
          </xsl:when>
          <xsl:otherwise>
            <xsl:value-of select="name"/>
          </xsl:otherwise>
        </xsl:choose>
      </a>
    </li>
  </xsl:if>
</xsl:template>

</xsl:stylesheet>
