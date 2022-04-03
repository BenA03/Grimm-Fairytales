<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns="http://www.w3.org/1999/xhtml"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math" exclude-result-prefixes="#all"
    version="3.0">
    <xsl:output method="xhtml" html-version="5" omit-xml-declaration="no" include-content-type="no"
        indent="yes"/>
    <xsl:template match="/">
        <html>
            <head>
                <title>
                    <xsl:value-of select="//metadata/title"/>
                </title>
                <link rel="stylesheet" type="text/css" href="Homepage_CSS.css"/>
            </head>
            <body>
                <h2>
                    <xsl:apply-templates select="//metadata/title"/>
                </h2>
                <xsl:apply-templates select="/fairytale/body"/>
            </body>
        </html>
    </xsl:template>
    <!-- Makes sure paragraphs are paragraphs -->
    <xsl:template match="p">
        <p>
            <xsl:apply-templates/>
        </p>
    </xsl:template>
    
    <!-- handle lines and lg's -->
    <xsl:template match="lg"> <!-- Change <lg> and <l> elements into spans with specific classes -->
        <lg>
            <xsl:apply-templates/>
        </lg>
    </xsl:template>
    
    <xsl:template match="l">
        <l>
            <xsl:apply-templates/>
        </l>
    </xsl:template>
    
    <!-- Action elements -->
    <xsl:template match="action">
        <xsl:choose>
            <xsl:when test="@gender eq 'male'">
                <span class="hoverable male_action">
                    <xsl:apply-templates/>
                </span>
            </xsl:when>
            <xsl:when test="@gender eq 'female'">
                <span class="hoverable female_action">
                    <xsl:apply-templates/>
                </span>
            </xsl:when>
            <xsl:when test="@gender eq 'mixed'">
                <span class="hoverable mixed_action">
                    <xsl:apply-templates/>
                </span>
            </xsl:when>
        </xsl:choose>
        <span class="hover">
            <xsl:value-of select="@agency"/>
            <xsl:text>, </xsl:text>
            <xsl:value-of select="@gender"/>
            <xsl:text>, </xsl:text>
            <xsl:value-of select="@willingness"/>
        </span>
    </xsl:template>
    <!-- Descriptor elements -->
    <xsl:template match="descriptor">
        <xsl:choose>
            <xsl:when test="@gender eq 'male'">
                <span class="hoverable male_descriptor">
                    <xsl:apply-templates/>
                </span>
            </xsl:when>
            <xsl:when test="@gender eq 'female'">
                <span class="hoverable female_descriptor">
                    <xsl:apply-templates/>
                </span>
            </xsl:when>
            <xsl:when test="@gender eq 'mixed'">
                <span class="hoverable mixed_descriptor">
                    <xsl:apply-templates/>
                </span>
            </xsl:when>
        </xsl:choose>
        <span class="hover">
            <xsl:value-of select="@type"/>
            <xsl:text>, </xsl:text>
            <xsl:value-of select="@gender"/>
        </span>
    </xsl:template>
</xsl:stylesheet>
