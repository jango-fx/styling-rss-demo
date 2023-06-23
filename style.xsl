<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="3.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:atom="http://www.w3.org/2005/Atom">
  <xsl:output method="html" version="1.0" encoding="UTF-8" />
  <xsl:template match="/">
    <html xmlns="http://www.w3.org/1999/xhtml" lang="en">
      <head>
        <title>
          <xsl:value-of select="/atom:feed/atom:title" />
        </title>
        <link rel="stylesheet" href="style.css" />
      </head>

      <body>

        <header>
          <h1>
            <xsl:value-of select="/atom:feed/atom:title" />
          </h1>
          <!-- <h2> -->
            <xsl:value-of select="/atom:feed/atom:subtitle" />
          <!-- </h2>  -->
        </header>

          <!-- <h3>Recent posts:</h3> -->
          <!-- <h4>Recent posts:</h4> -->
        <main>
          <xsl:for-each select="/atom:feed/atom:entry">
            <article>
              <div class="date-update" >
              <xsl:value-of select="substring(atom:updated, 9, 2)" />.<xsl:value-of
                select="substring(atom:updated, 6, 2)" />.<xsl:value-of
                select="substring(atom:updated, 0, 5)" />
              </div>
              <h3>
                <!-- <a> -->
                  <!-- <xsl:attribute name="href"> -->
                    <!-- <xsl:value-of select="atom:link/@href" /> -->
                  <!-- </xsl:attribute> -->
                  <xsl:value-of select="atom:title" />
                <!-- </a> -->
              </h3>
                <p class="summary">
                <xsl:if test="atom:summary">
                  <b>tl;dr: </b>
                  <i>
                    <xsl:value-of select="atom:summary" disable-output-escaping="yes" />
                  </i>
                </xsl:if>
              </p>
              <p>
                <xsl:value-of select="atom:content" disable-output-escaping="yes" />
              </p>
              <xsl:for-each select="atom:category">
              <div class="tag">
              <xsl:value-of select="@term" />
              </div>
              </xsl:for-each>
            </article>
          </xsl:for-each>
        </main>

        <footer>
        </footer>

      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>