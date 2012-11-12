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
            
            <h2>Stops</h2>
            
            <table class="table table-bordered table-striped">
              <thead>
                <tr>
                  <th>Stop</th>
                  <th>Time</th>
                  <th>Distance</th>
                  <th></th>
                </tr>
              </thead>
              <xsl:for-each select="Stops/Stop">
                <tr>
                  <td>
                    <xsl:value-of select="Location/city"/>,
                    <xsl:value-of select="Location/station"/>
                  </td>
                  <td>
                    <span class="label label-success">
                      <xsl:value-of select="time"/>
                    </span>
                  </td>
                  <td>
                    <span class="label">
                      <xsl:value-of select="distance"/> km
                    </span>
                  </td>
                  <td width="400">
                    <img src="http://maps.googleapis.com/maps/api/staticmap?center={Location/latitude},{Location/longitude}&amp;zoom=10&amp;size=400x120&amp;maptype=roadmap
&amp;markers=color:blue%7Clabel:%7C{Location/latitude},{Location/longitude}&amp;sensor=false" />
                  </td>
                </tr>
              </xsl:for-each>
            </table>
              
            <h2>Schedule</h2>
          
            <table class="table table-bordered table-striped" style="width: 200px;">
              <tr>
                <td>Weekdays</td>
                <td>
                  <xsl:choose>
                    <xsl:when test="ScheduleRules/weekdays='1'">
                      <span class="label label-success">Yes</span>
                    </xsl:when>
                    <xsl:when test="ScheduleRules/weekdays='0'">
                      <span class="label label-warning">No</span>
                    </xsl:when>
                  </xsl:choose>
                </td>
              </tr>
              <tr>
                <td>Saturdays</td>
                <td>
                  <xsl:choose>
                    <xsl:when test="ScheduleRules/saturday='1'">
                      <span class="label label-success">Yes</span>
                    </xsl:when>
                    <xsl:when test="ScheduleRules/saturday='0'">
                      <span class="label label-warning">No</span>
                    </xsl:when>
                  </xsl:choose>
                </td>
              </tr>
              <tr>
                <td>Sundays</td>
                <td>
                  <xsl:choose>
                    <xsl:when test="ScheduleRules/sunday='1'">
                      <span class="label label-success">Yes</span>
                    </xsl:when>
                    <xsl:when test="ScheduleRules/sunday='0'">
                      <span class="label label-warning">No</span>
                    </xsl:when>
                  </xsl:choose>
                </td>
              </tr>
              <tr>
                <td>Holidays</td>
                <td>
                  <xsl:choose>
                    <xsl:when test="ScheduleRules/holidays='1'">
                      <span class="label label-success">Yes</span>
                    </xsl:when>
                    <xsl:when test="ScheduleRules/holidays='0'">
                      <span class="label label-warning">No</span>
                    </xsl:when>
                  </xsl:choose>
                </td>
              </tr>
            </table>
            
              
          </xsl:for-each>
          

        </div>

      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
