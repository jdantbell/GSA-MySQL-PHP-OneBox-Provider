<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:template name="projects">
  <!--  This Stylesheet is based on the html accordeon found in http://www.cssscript.com/super-smooth-accordion-with-pure-css-css3/
          elements where modified so XSLT would translate the XML coming from the GSA after interpreting the provider onebox_provider_myG.php using a MySQL database  
            JDA Bellot
            -->
      

         <STYLE type="text/css">
                        .accordion {
                          width: 650px;
                          padding: 3px;
                          background-color: #E5ECF9;
                          border-radius: 10px; 
                        }
                        .single-accordion {
                          height: 35px;
                          overflow: hidden;
                          background: #3366CC;
                          color:#fff;
                          margin-bottom: 5px;
                          
                          -webkit-transition: all 1s;
                        }
                        .single-accordion:hover {
                          height: 150px;
                          border-radius: 10px;
                          -webkit-transition: all 1s;
                        }
                        .single-accordion h2:hover { cursor: pointer; }

                        .single-accordion h6 {
                          color: #ccc;
                          font-size: 8px;
                          font-variant: small-caps; 
                        }
                        .single-accordion p {
                          line-height: 10px;
                          color: #fff;
                          text-align: justify;
                        }
        </STYLE>
        <div class="accordion">
                      <h2>MyG Onebox Results</h2>
                        <xsl:for-each select="MODULE_RESULT">
                           <div class="single-accordion">
                             <span style="float: right;font-weight: bolder;font-size: 20px;padding-right: 10px;padding-top: 7px;margin-top: ‒5;position: inherit;
                             ">▼</span>                   
    
                              <xsl:for-each select="Field">                         
                                 <p><xsl:value-of select="@name"/>: 
                               <xsl:value-of select="."/></p>
                              
                          </xsl:for-each>
                        </div>
                        </xsl:for-each>
                    
        </div>  





</xsl:template>
</xsl:stylesheet>
