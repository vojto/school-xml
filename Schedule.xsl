<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:template match="/">
    <html xmlns="http://www.w3.org/1999/xhtml">
      <head>
        <title>Schedule</title>
        <link rel="stylesheet" href="stylesheets/bootstrap.css"/>
        <link rel="stylesheet" href="stylesheets/screen.css"/>
      </head>
      <body>
        <div class="navbar navbar-fixed-top">
          <div class="navbar-inner">
            <div class="container">
              <a class="brand" href="#">Schedule</a>
            </div>
          </div>
        </div>
        
        <div id="main-container" class="container">

         	<xsl:for-each select="Schedule/Connection">
            <h1>
              <xsl:value-of select="name"/>
            </h1>
            
            <xsl:for-each select="Stops/Stop">
              <h3>
                <xsl:value-of select="Location/city"/>,
                <xsl:value-of select="Location/station"/>
              </h3>
            </xsl:for-each>
          </xsl:for-each>
          
        </div>

      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
