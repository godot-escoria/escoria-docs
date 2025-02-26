<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="text"/>
    <!-- Convert <class> to top-level header and add inheritance information -->
    <xsl:template match="class">
# <xsl:value-of select="@name"/>
<xsl:text>&#10;</xsl:text>
        <xsl:if test="@inherits">
**Extends:** [<xsl:value-of select="@inherits"/>](api/<xsl:value-of select="@inherits"/>)
        </xsl:if>
<xsl:apply-templates select="brief_description"/>
<xsl:apply-templates select="description"/>
<xsl:apply-templates select="methods"/>
    </xsl:template>
    <!-- Convert <brief_description> to Markdown inline code -->
      <xsl:template match="brief_description">
## Description
<xsl:text>&#10;</xsl:text>
<xsl:value-of select="normalize-space(.)"/>
<xsl:text>&#10;</xsl:text>
    </xsl:template>
    <!-- Convert <description> to Markdown paragraph -->
      <xsl:template match="description">
<xsl:variable name="depth" select="count(ancestor::*)" />
<xsl:if test="$depth > 1">## Description</xsl:if>
<xsl:text>&#10;</xsl:text>
<xsl:value-of select="normalize-space(.)"/>
<xsl:text>&#10;</xsl:text>
    </xsl:template>
    <!-- Convert <methods> section -->
    <xsl:template match="methods">
## Method Descriptions
<xsl:apply-templates select="method"/>
    </xsl:template>
    <!-- Convert <method> to Markdown subsection -->
    <xsl:template match="method">
### <xsl:value-of select="@name"/>
<xsl:text>&#10;</xsl:text>
```gdscript
func <xsl:value-of select="@name"/>(<xsl:apply-templates select="param" mode="signature"/>)<xsl:if test="return/@type"><xsl:text> -> </xsl:text><xsl:value-of select="return/@type"/></xsl:if>
```
<xsl:apply-templates select="description"/>
    </xsl:template>
    <!-- Format method parameters for function signature -->
    <xsl:template match="param" mode="signature">
        <xsl:if test="position() > 1">, </xsl:if>
<xsl:value-of select="@name"/>: <xsl:value-of select="@type"/>
    </xsl:template>
    <!-- Convert <members> section -->
    <xsl:template match="members">
## Members
<xsl:text>&#10;</xsl:text>
<xsl:apply-templates select="member"/>
    </xsl:template>
</xsl:stylesheet>

