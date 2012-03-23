<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet
  version="1.0"
  xmlns:yzx="http://www.ydezignx.com/NS"  
  xmlns:str="http://www.ora.com/XSLTCookbook/namespaces/strings"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:include href="./util.xsl"/>
  
  <!-- Collection of useful variables -->

  <!-- new line -->
  <xsl:variable name="nl">
<xsl:text>
</xsl:text>    
  </xsl:variable>

  <!-- tab -->
  <xsl:variable name="tab">
    <xsl:text>	</xsl:text>
  </xsl:variable>
  <xsl:variable name="yzx:tab">
    <xsl:text>	</xsl:text>    
  </xsl:variable>

  <!-- ampersand -->
  <xsl:variable name="amp">
    <xsl:text>&amp;</xsl:text>
  </xsl:variable>

  <!-- apostrophe -->
  <xsl:variable name="apos">
    <xsl:text>'</xsl:text>
  </xsl:variable>

  <!-- quote -->
  <xsl:variable name="quot">
    <xsl:text>"</xsl:text>
  </xsl:variable>

  <!-- greater than -->
  <xsl:variable name="gt">
    <xsl:text>></xsl:text>
  </xsl:variable>

  <!-- lower than -->
  <xsl:variable name="lt">
    <xsl:text>&lt;</xsl:text>
  </xsl:variable>
  
  <!-- space -->
  <xsl:variable name="yzx:space">
<xsl:text> </xsl:text>
  </xsl:variable>

  <!-- indent -->
  <xsl:variable name="yzx:sIndentSize" select="2"/>
  <xsl:variable name="yzx:sIndent">
    <xsl:call-template name="str:dup">
      <xsl:with-param name="input" select="$yzx:space"/>
      <xsl:with-param name="count" select="$yzx:sIndentSize"/>
    </xsl:call-template>
  </xsl:variable>

  <!-- indenting with spaces - up to 8 deep -->
  <xsl:variable name="is1">
    <xsl:call-template name="yzx:tag">
      <xsl:with-param name="hook"  select="$nl"/>
      <xsl:with-param name="stuff" select="$yzx:sIndent"/>
      <xsl:with-param name="count" select="1"/>
    </xsl:call-template>
  </xsl:variable>
  <xsl:variable name="is2">
    <xsl:call-template name="yzx:tag">
      <xsl:with-param name="hook"  select="$nl"/>
      <xsl:with-param name="stuff" select="$yzx:sIndent"/>
      <xsl:with-param name="count" select="2"/>
    </xsl:call-template>
  </xsl:variable>
  <xsl:variable name="is3">
    <xsl:call-template name="yzx:tag">
      <xsl:with-param name="hook"  select="$nl"/>
      <xsl:with-param name="stuff" select="$yzx:sIndent" />
      <xsl:with-param name="count" select="3" />
    </xsl:call-template>
  </xsl:variable>
  <xsl:variable name="is4">
    <xsl:call-template name="yzx:tag">
      <xsl:with-param name="hook"  select="$nl"/>
      <xsl:with-param name="stuff" select="$yzx:sIndent" />
      <xsl:with-param name="count" select="4" />
    </xsl:call-template>
  </xsl:variable>
  <xsl:variable name="is5">
    <xsl:call-template name="yzx:tag">
      <xsl:with-param name="hook"  select="$nl"/>
      <xsl:with-param name="stuff" select="$yzx:sIndent" />
      <xsl:with-param name="count" select="5" />
    </xsl:call-template>
  </xsl:variable>
  <xsl:variable name="is6">
    <xsl:call-template name="yzx:tag">
      <xsl:with-param name="hook"  select="$nl"/>
      <xsl:with-param name="stuff" select="$yzx:sIndent" />
      <xsl:with-param name="count" select="6" />
    </xsl:call-template>
  </xsl:variable>
  <xsl:variable name="is7">
    <xsl:call-template name="yzx:tag">
      <xsl:with-param name="hook"  select="$nl"/>
      <xsl:with-param name="stuff" select="$yzx:sIndent" />
      <xsl:with-param name="count" select="7" />
    </xsl:call-template>
  </xsl:variable>
  <xsl:variable name="is8">
    <xsl:call-template name="yzx:tag">
      <xsl:with-param name="hook"  select="$nl"/>
      <xsl:with-param name="stuff" select="$yzx:sIndent" />
      <xsl:with-param name="count" select="8" />
    </xsl:call-template>
  </xsl:variable>
  
  <!-- indenting with tabs - up to 8 deep -->
  <xsl:variable name="it1">
    <xsl:call-template name="yzx:tag">
      <xsl:with-param name="hook"  select="$nl"/>
      <xsl:with-param name="stuff" select="$yzx:tab" />
      <xsl:with-param name="count" select="1" />
    </xsl:call-template>
  </xsl:variable>
  <xsl:variable name="it2">
    <xsl:call-template name="yzx:tag">
      <xsl:with-param name="hook"  select="$nl"/>
      <xsl:with-param name="stuff" select="$yzx:tab" />
      <xsl:with-param name="count" select="2" />
    </xsl:call-template>
  </xsl:variable>
  <xsl:variable name="it3">
    <xsl:call-template name="yzx:tag">
      <xsl:with-param name="hook"  select="$nl"/>
      <xsl:with-param name="stuff" select="$yzx:tab" />
      <xsl:with-param name="count" select="3" />
    </xsl:call-template>
  </xsl:variable>
  <xsl:variable name="it4">
    <xsl:call-template name="yzx:tag">
      <xsl:with-param name="hook"  select="$nl"/>
      <xsl:with-param name="stuff" select="$yzx:tab" />
      <xsl:with-param name="count" select="4" />
    </xsl:call-template>
  </xsl:variable>
  <xsl:variable name="it5">
    <xsl:call-template name="yzx:tag">
      <xsl:with-param name="hook"  select="$nl"/>
      <xsl:with-param name="stuff" select="$yzx:tab" />
      <xsl:with-param name="count" select="5" />
    </xsl:call-template>
  </xsl:variable>
  <xsl:variable name="it6">
    <xsl:call-template name="yzx:tag">
      <xsl:with-param name="hook"  select="$nl"/>
      <xsl:with-param name="stuff" select="$yzx:tab" />
      <xsl:with-param name="count" select="6" />
    </xsl:call-template>
  </xsl:variable>
  <xsl:variable name="it7">
    <xsl:call-template name="yzx:tag">
      <xsl:with-param name="hook"  select="$nl"/>
      <xsl:with-param name="stuff" select="$yzx:tab" />
      <xsl:with-param name="count" select="7" />
    </xsl:call-template>
  </xsl:variable>
  <xsl:variable name="it8">
    <xsl:call-template name="yzx:tag">
      <xsl:with-param name="hook"  select="$nl"/>
      <xsl:with-param name="stuff" select="$yzx:tab" />
      <xsl:with-param name="count" select="8" />
    </xsl:call-template>
  </xsl:variable>
  
</xsl:stylesheet>