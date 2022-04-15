<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns="http://www.w3.org/2000/svg"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math" version="3.0"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="#all">
    <xsl:output method="xml" indent="yes"/>

    <!-- This xslt decomposes a group of stories into three pie charts to display happy endings -->

    <xsl:variable name="both" as="document-node()+"
        select="collection('../../sorted_markup/?recurse=yes;select=*.xml')"/>
    <xsl:variable name="earlier" as="document-node()+"
        select="collection('../../sorted_markup/1812-1815?select=*.xml')"/>
    <xsl:variable name="later" as="document-node()+"
        select="collection('../../sorted_markup/1819-1857?select=*.xml')"/>

    <xsl:template name="xsl:initial-template">
        <svg viewBox="500 0 600 600">
            <g>
                <!-- Variable declarations -->
                <xsl:variable name="xSpacing" as="xs:integer" select="400"/>
                <xsl:variable name="circleSize" as="xs:integer" select="150"/>
                <xsl:variable name="circumference" as="xs:double"
                    select="math:pi() * ($circleSize * 1)"/>

                <text text-anchor="middle" x="{$xSpacing * 2}" y="50" font-size="30">How often do
                    the stories have a happy ending?</text>
                <text text-anchor="middle" x="{$xSpacing * 2}" y="{300 + $circleSize + 95}"
                    font-size="20" fill="green">Green: Happy Ending</text>
                <text text-anchor="middle" x="{$xSpacing * 2}" y="{300 + $circleSize + 120}"
                    font-size="20" fill="red">Red: Unhappy Ending</text>
                
                <!-- 1812 title and variables -->
                <xsl:variable name="allEnding1812" as="xs:integer"
                    select="count($earlier//ending)"/>
                <text text-anchor="middle" x="{$xSpacing * 1}" y="{300 + $circleSize + 50}"
                    >Only 1812-1815 Stories</text>

                <!-- draw the slices for 1812 -->

                <!-- Happy! (Since the other slices will cover up their share, we can make this one the full circle area) -->
                <circle cx="{$xSpacing * 1}" cy="300" r="{$circleSize}" fill="green" stroke="black"
                    stroke-width="1"/>

                <!-- Unhappy :( -->
                <xsl:variable name="sad1812" as="xs:integer"
                    select="count($earlier//ending[@happy_ending = 'false'])"/>

                    <circle cx="{$xSpacing * 1}" cy="300" r="{$circleSize div 2}" fill="none"
                        stroke="red" stroke-width="{$circleSize}"
                        stroke-dasharray="{$circumference * $sad1812 div $allEnding1812 div 2} 1000"
                    />
                
                <!-- <text text-anchor="middle" x="{$xSpacing * 1}" y="{300 + $circleSize + 25}"
                    ><xsl:value-of select="$allEnding1812"/> - <xsl:value-of select="$sad1812"/></text>
                    (Debugging tool) -->


                <!-- clean outline -->
                <circle cx="{$xSpacing * 1}" cy="300" r="{$circleSize}" fill="none" stroke="black"
                    stroke-width="2"/>

                <!-- 1857 title and variables -->
                <xsl:variable name="allEnding1857" as="xs:integer"
                    select="count($later//ending)"/>
                <text text-anchor="middle" x="{$xSpacing * 2}" y="{300 + $circleSize + 50}"
                    >Only 1819-1857 Stories</text>
                
                <!-- draw the slices for 1857 -->
                
                <!-- Happy! (Since the other slices will cover up their share, we can make this one the full circle area) -->
                <circle cx="{$xSpacing * 2}" cy="300" r="{$circleSize}" fill="green" stroke="black"
                    stroke-width="1"/>
                
                <!-- Unhappy :( -->
                <xsl:variable name="sad1857" as="xs:integer"
                    select="count($later//ending[@happy_ending = 'false'])"/>
                <g transform="matrix(1 0 0 -1 0 400) translate(0,-200)">
                    <circle cx="{$xSpacing * 2}" cy="300" r="{$circleSize div 2}" fill="none"
                        stroke="red" stroke-width="{$circleSize}"
                        stroke-dasharray="{$circumference * $sad1857 div $allEnding1857 div 2} 1000"
                    />
                </g>
                
                <!-- clean outline -->
                <circle cx="{$xSpacing * 2}" cy="300" r="{$circleSize}" fill="none" stroke="black"
                    stroke-width="2"/>
                
                <!-- All stories title and variables -->
                <xsl:variable name="allEndingBoth" as="xs:integer"
                    select="count($both//ending)"/>
                <text text-anchor="middle" x="{$xSpacing * 3}" y="{300 + $circleSize + 50}"
                    >Across all editions</text>
                
                <!-- draw the slices for all editions -->
                
                <!-- Happy! (Since the other slices will cover up their share, we can make this one the full circle area) -->
                <circle cx="{$xSpacing * 3}" cy="300" r="{$circleSize}" fill="green" stroke="black"
                    stroke-width="1"/>
                
                <!-- Unhappy :( -->
                <xsl:variable name="sadBoth" as="xs:integer"
                    select="count($both//ending[@happy_ending = 'false'])"/>
                <g transform="matrix(1 0 0 -1 0 400) translate(0,-200)">
                    <circle cx="{$xSpacing * 3}" cy="300" r="{$circleSize div 2}" fill="none"
                        stroke="red" stroke-width="{$circleSize}"
                        stroke-dasharray="{$circumference * $sadBoth div $allEndingBoth div 2} 1000"
                    />
                </g>
                
                <!-- clean outline -->
                <circle cx="{$xSpacing * 3}" cy="300" r="{$circleSize}" fill="none" stroke="black"
                    stroke-width="2"/>
                

            </g>
        </svg>
    </xsl:template>

</xsl:stylesheet>
