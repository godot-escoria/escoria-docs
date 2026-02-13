<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="text"/>
    <!-- Convert <class> to top-level header and add inheritance information -->
    <xsl:template match="class">
  (<xsl:value-of select="@name"/>)=
# <xsl:value-of select="@name"/>
<xsl:text>&#10;</xsl:text>
        <xsl:if test="@inherits">
**Extends:** {ref}`<xsl:value-of select="@inherits"/><xsl:text>&#160;&lt;</xsl:text><xsl:value-of select="@inherits"/><xsl:text>&gt;</xsl:text>`
        </xsl:if>
<xsl:apply-templates select="brief_description"/>
<xsl:apply-templates select="description"/>
<xsl:apply-templates select="constants"/>
<xsl:apply-templates select="members"/>
<xsl:apply-templates select="signals"/>
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
<xsl:text>&#10;</xsl:text>
<xsl:value-of select="normalize-space(.)"/>
<xsl:text>&#10;</xsl:text>
    </xsl:template>
    <!-- Convert <constants> section -->
      <xsl:template match="constants">
## Constants
<xsl:apply-templates select="constant[@enum]"/>
<xsl:apply-templates select="constant[not(@enum)]"/>
      </xsl:template>
    <!-- Convert <constant> to Markdown subsection -->
      <xsl:template match="constant[@enum]">
        <xsl:if test="not(starts-with(@name, '_')) and not(starts-with(@enum, '_'))">
### <xsl:call-template name="replace"><xsl:with-param name="text" select="@name" /></xsl:call-template>
```gdscript
const <xsl:value-of select="@name" /> = <xsl:value-of select="@value" /> # enum<xsl:if test="@enum != '@unnamed_enums'"> "<xsl:call-template name="replace"><xsl:with-param name="text" select="@enum" /></xsl:call-template>"</xsl:if>

```
<xsl:if test="normalize-space(.) != ''"><xsl:value-of select="normalize-space(.)"/></xsl:if>
        </xsl:if>
      </xsl:template>
      <xsl:template match="constant[not(@enum)]">
        <xsl:if test="not(starts-with(@name, '_'))">
### <xsl:call-template name="replace"><xsl:with-param name="text" select="@name" /></xsl:call-template>
```gdscript
const <xsl:value-of select="@name" /> = <xsl:value-of select="@value" />

```
<xsl:if test="normalize-space(.) != ''"><xsl:value-of select="normalize-space(.)"/></xsl:if>
        </xsl:if>
      </xsl:template>
    <!-- Convert <methods> section -->
    <xsl:template match="methods">
## Methods
<xsl:apply-templates select="method"/>
    </xsl:template>
    <!-- Convert <method> to Markdown subsection -->
    <xsl:template match="method">
      <xsl:if test="not(starts-with(@name, '_'))">    
% ...
---
### <xsl:call-template name="replace">
              <xsl:with-param name="text" select="@name" />
            </xsl:call-template>
<xsl:text>&#10;</xsl:text>
```gdscript
func <xsl:value-of select="@name"/>(<xsl:apply-templates select="param" mode="signature"/>)<xsl:if test="return/@type"><xsl:text> -> </xsl:text><xsl:value-of select="return/@type"/></xsl:if>
```
<xsl:if test="normalize-space(description) != ''"><xsl:apply-templates select="description"/></xsl:if>
      </xsl:if>
    </xsl:template>
    <!-- Format method parameters for function signature -->
    <xsl:template match="param" mode="signature">
        <xsl:if test="position() > 1">, </xsl:if>
<xsl:value-of select="@name"/>: <xsl:value-of select="@type"/>
    </xsl:template>
    <!-- Convert <members> section -->
    <xsl:template match="members">
## Members
<xsl:apply-templates select="member"/>
    </xsl:template>
    <!-- Convert <member> to a Markdown list item -->
      <xsl:template match="member">
      <xsl:if test="not(starts-with(@name, '_'))">    
### <xsl:call-template name="replace">
              <xsl:with-param name="text" select="@name" />
            </xsl:call-template>
<xsl:text>&#10;</xsl:text>
```gdscript
var <xsl:value-of select="@name"/>: <xsl:value-of select="@type"/>
```
<xsl:if test="normalize-space(.) != ''">
<xsl:text>&#10;</xsl:text>
<xsl:value-of select="normalize-space(.)"/>
<xsl:text>&#10;</xsl:text>
</xsl:if>
      </xsl:if>
    </xsl:template>

    <!-- Convert <signals> section -->
    <xsl:template match="signals">
## Signals
<xsl:apply-templates select="signal"/>
    </xsl:template>
    <!-- Convert <signal> to Markdown subsection -->
    <xsl:template match="signal">
### <xsl:call-template name="replace">
              <xsl:with-param name="text" select="@name" />
            </xsl:call-template>
<xsl:text>&#10;</xsl:text>
```gdscript
signal <xsl:value-of select="@name"/>(<xsl:apply-templates select="param" mode="signature"/>)
```
<xsl:apply-templates select="description"/>
    </xsl:template>
    <!-- Format method parameters for function signature -->
    <xsl:template match="param" mode="signature">
        <xsl:if test="position() > 1">, </xsl:if>
<xsl:value-of select="@name"/>: <xsl:value-of select="@type"/>
    </xsl:template>
    <!-- Recursive replacement template -->
    <xsl:template name="replace">
        <xsl:param name="text"/>
        <xsl:choose>
            <!-- If there's an underscore, replace it with \_ -->
            <xsl:when test="contains($text, '_')">
                <xsl:value-of select="substring-before($text, '_')"/>
                <xsl:text>\_</xsl:text>
                <xsl:call-template name="replace">
                    <xsl:with-param name="text" select="substring-after($text, '_')"/>
                </xsl:call-template>
            </xsl:when>
            <!-- No more underscores, output the remaining text -->
            <xsl:otherwise>
                <xsl:value-of select="$text"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

</xsl:stylesheet>

