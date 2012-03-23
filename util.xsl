<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet
  version="1.0"
  xmlns:yzx="http://www.ydezignx.com/NS"
  xmlns:str="http://www.ora.com/XSLTCookbook/namespaces/strings"
  xmlns:math="http://www.ora.com/XSLTCookbook/namespaces/math"
  xmlns:f="http://www.ora.com/XSLTCookbook/namespaces/f"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <!-- Collection of useful utilities -->

  <!-- Duplicate a String N Times -->
  <xsl:template name="str:dup">
    <xsl:param name="input"/>
    <xsl:param name="count" select="1"/>
    <xsl:choose>
      <xsl:when test="not($count) or not($input)"/>
      <xsl:when test="$count = 1">
        <xsl:value-of select="$input"/>
      </xsl:when>
      <xsl:otherwise>
        <!-- If $count is odd append an extra copy of input -->
        <xsl:if test="$count mod 2">
          <xsl:value-of select="$input"/>
        </xsl:if>
        <!-- Recursively apply template after doubling input and
          halving count -->
        <xsl:call-template name="str:dup">
          <xsl:with-param name="input" select="concat($input,$input)"/>
          <xsl:with-param name="count" select="floor($count div 2)"/>
        </xsl:call-template>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <!-- Sum up -->
  <xsl:template name="math:sum">
    <xsl:param name="nodes" select="/.."/>
    <xsl:param name="result" select="'0'"/>
    <xsl:param name="docName" select="''"/>
    <xsl:param name="tempName" select="''"/>
    <xsl:choose>
      <xsl:when test="not($nodes)">
        <xsl:value-of select="$result"/>
      </xsl:when>
      <xsl:otherwise>
        <!-- call or apply template that will determine value of node unless the node is literally the value to be summed -->
        <xsl:variable name="value">
          <xsl:apply-templates select="document($docName)/*/f:func[@name=$tempName]">
            <xsl:with-param name="node" select="$nodes[1]"/>
          </xsl:apply-templates>
        </xsl:variable>
        <xsl:call-template name="math:sum">
          <xsl:with-param name="nodes" select="$nodes[position() != 1]"/>
          <xsl:with-param name="result" select="$result + $value"/>
          <xsl:with-param name="docName" select="$docName"/>
          <xsl:with-param name="tempName" select="$tempName"/>
        </xsl:call-template>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <!-- Construct Tag by pefixing a string duplicated N times with some beginning string -->
  <xsl:template name="yzx:tag">
    <xsl:param name="hook"/>
    <xsl:param name="stuff"/>
    <xsl:param name="count" select="1"/>
    <xsl:choose>
      <xsl:when test="not($hook)" />
      <xsl:otherwise>
        <xsl:value-of select="$hook"/>
        <xsl:call-template name="str:dup">
          <xsl:with-param name="input" select="$stuff"/>
          <xsl:with-param name="count" select="$count"/>
        </xsl:call-template>
      </xsl:otherwise>
    </xsl:choose>

  </xsl:template>

</xsl:stylesheet>