<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns="http://www.w3.org/2000/svg"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math" exclude-result-prefixes="#all"
    version="3.0">
    <xsl:output method="xml" indent="yes" omit-xml-declaration="yes"/>
    
    <xsl:variable name="fairytales" as="document-node()+"
        select="collection('sorted_markup/1819-1857/?select=*.xml')"/>
    <xsl:variable name="barWidth" as="xs:integer" select="15"/>
    <xsl:variable name="barSpacing" as="xs:float" select="$barWidth div 1.25"/>
    <xsl:variable name="foobar" as="xs:double" select="($barWidth + $barSpacing) * 3.5"/>
    <xsl:variable name="xLength" as="xs:double"
        select="count($fairytales) * $foobar"/>
    <xsl:variable name="yScale" as="xs:integer" select="200"/>
    
    <xsl:template name="xsl:initial-template">
        <svg viewBox="50 -600 1050 600" width="100%">
            <g transform="scale(.75) translate(150, -150)">
                <xsl:apply-templates select="$fairytales"/>
            </g>
            <!--=================================================== AGENCY BELOW ===================================================-->
            <g transform="scale(.75) translate(150, -150)">
                <line x1="25" y1="-210" x2="{$xLength}" y2="-210" stroke="black"/>
                <line x1="25" y1="-210" x2="25" y2="-{235 + $yScale}" stroke="black"/>
                <xsl:for-each select="(1 to ($yScale div 50))">
                    <line x1="25" y1="-{. * 50 + 210}" x2="{$xLength}" y2="-{. * 50 + 210}"
                        stroke="black" stroke-dasharray="3"/>
                    <text x="-25" y="-{. * 50 - 5 + 210}" stroke="black" fill="black"
                        ><xsl:value-of select=". * 25"/>%</text>
                </xsl:for-each>
            </g>
        </svg>
    </xsl:template>
    
    <xsl:template match="$fairytales">
        <xsl:for-each select="$fairytales/*">
            <text x="-200" y="-{(position() - .5) * $foobar}" transform="rotate(90)">
                <xsl:value-of select="//title"/>
            </text>
            <g>
                <xsl:variable name="actionTotal" as="xs:integer" select="count(//action)"/>
                <xsl:variable name="pos" as="xs:double" select="(position() - .5) * $foobar"/>
                <xsl:variable name="interSpace" select="$barSpacing div 2" as="xs:double"/>
                <!--=================================================== AGENCY BELOW ===================================================-->
                
                <xsl:variable name="pCount" select="(count(//action[@agency = 'passive']) div $actionTotal)"/>
                <xsl:variable name="pHeight" select="$pCount * $yScale"/>
                <rect x="{$pos - $barWidth - $interSpace}" y="-{$pHeight + 210}" width="{$barWidth}" height="{$pHeight}" fill="red"/>
                <xsl:variable name="aCount" select="(count(//action[@agency = 'active']) div $actionTotal)"/>
                <xsl:variable name="aHeight" select="$aCount * $yScale"/>
                <rect x="{$pos - $barWidth - $interSpace}" y="-{$aHeight + 210 + $pHeight}" width="{$barWidth}" height="{$aHeight}" fill="gray"/>
                
                <!--=================================================== GENDER BELOW ===================================================-->
                
                <xsl:variable name="mCount" select="(count(//action[@gender = 'male']) div $actionTotal)"/>
                <xsl:variable name="mHeight" select="$mCount * $yScale"/>
                <rect x="{$pos}" y="-{$mHeight + 210}" width="{$barWidth}" height="{$mHeight}" fill="blue"/>
                <xsl:variable name="fCount" select="(count(//action[@gender = 'female']) div $actionTotal)"/>
                <xsl:variable name="fHeight" select="$fCount * $yScale"/>
                <rect x="{$pos}" y="-{$fHeight + 210 + $mHeight}" width="{$barWidth}" height="{$fHeight}" fill="pink"/>
                <xsl:variable name="mixCount" select="(count(//action[@gender = 'mixed']) div $actionTotal)"/>
                <xsl:variable name="mixHeight" select="$mixCount * $yScale"/>
                <rect x="{$pos}" y="-{$mixHeight + 210 + $mHeight + $fHeight}" width="{$barWidth}" height="{$mixHeight}" fill="purple"/>
                
                <!--=================================================== WILLINGNESS BELOW ===================================================-->
                
                <xsl:variable name="hCount" select="(count(//action[@willingness = 'hesitant']) div $actionTotal)"/>
                <xsl:variable name="hHeight" select="$hCount * $yScale"/>
                <rect x="{$pos + $barWidth + $interSpace}" y="-{$hHeight + 210}" width="{$barWidth}" height="{$hHeight}" fill="red"/>
                <xsl:variable name="nCount" select="(count(//action[@willingness = 'neutral']) div $actionTotal)"/>
                <xsl:variable name="nHeight" select="$nCount * $yScale"/>
                <rect x="{$pos + $barWidth + $interSpace}" y="-{$nHeight + 210 + $hHeight}" width="{$barWidth}" height="{$nHeight}" fill="gray"/>
                <xsl:variable name="eCount" select="(count(//action[@willingness = 'eager']) div $actionTotal)"/>
                <xsl:variable name="eHeight" select="$eCount * $yScale"/>
                <rect x="{$pos + $barWidth + $interSpace}" y="-{$eHeight + 210 + $hHeight + $nHeight}" width="{$barWidth}" height="{$eHeight}" fill="green"/>
            </g>
        </xsl:for-each>
    </xsl:template>
</xsl:stylesheet>
