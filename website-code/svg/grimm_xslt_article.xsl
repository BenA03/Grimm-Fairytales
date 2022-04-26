<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns="http://www.w3.org/1999/xhtml"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math" exclude-result-prefixes="#all"
    version="3.0">
    <xsl:output method="xhtml" html-version="5" omit-xml-declaration="yes" include-content-type="no"
        indent="yes"/>
    <xsl:template match="/">
        <article>
            <h2>
                <xsl:apply-templates select="//metadata/title"/>
            </h2>
            <xsl:apply-templates select="/fairytale/body"/>
        </article>
    </xsl:template>
    <!-- Makes sure paragraphs are paragraphs -->
    <xsl:template match="p">
        <p>
            <xsl:apply-templates/>
        </p>
    </xsl:template>
    <!-- handle lines and lg's -->
    <xsl:template match="lg"> <!-- Changed <lg> and <l> elements into spans with specific classes -->
        <span class="lg">
            <xsl:apply-templates/>
        </span>
    </xsl:template>
    
    <xsl:template match="l">
        <span class="l">
            <xsl:apply-templates/>
        </span>
    </xsl:template>
    <!-- Action elements -->
    <xsl:template match="action"> <!-- Replaced <when> with specified attribute values in the <span> classes -->
        <span class="hoverable {@gender}_action">
            <xsl:apply-templates/>
        </span>
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
        <span class="hoverable {@gender}_descriptor">
            <xsl:apply-templates/>
        </span>
        <span class="hover">
            <xsl:value-of select="@type"/>
            <xsl:text>, </xsl:text>
            <xsl:value-of select="@gender"/>
        </span>
    </xsl:template>
</xsl:stylesheet>
