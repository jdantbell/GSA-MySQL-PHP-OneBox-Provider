<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

  <!-- Step 1: edit the xsl:include to point to your stylesheet file -->

  <xsl:include href="onebox-default.xsl"/>
  
  <!-- Step 2: change the xsl:call-template to call your templates name -->
  
  <xsl:template name="holder" match="OBRES">
    <div class="oneboxResults">
      <table>
        <xsl:call-template name="onebox-default"/>
      </table>
    </div>
  </xsl:template>
</xsl:stylesheet> 