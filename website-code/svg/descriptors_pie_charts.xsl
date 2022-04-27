<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns="http://www.w3.org/2000/svg"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math" version="3.0"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="#all">
    <xsl:output method="xml" indent="yes"/>

    <!-- This xslt decomposes a group of stories into three pie charts to display descriptors -->

    <xsl:variable name="editionOne" as="document-node()+" select="collection('../../sorted_markup/?recurse=yes;select=*.xml')"/>
    <!-- <xsl:variable name="editionOne" as="document-node()+" select="collection('../../sorted_markup/1819-1857?select=*.xml')"/> -->
    
    <xsl:template name = "xsl:initial-template">
        <svg viewBox="500 0 600 600">
            <g>
                <!-- Variable declarations -->
                <xsl:variable name="xSpacing" as="xs:integer" select="400"/>
                <xsl:variable name="circleSize" as="xs:integer" select="150"/>
                <xsl:variable name="circumference" as="xs:double"
                    select="math:pi() * ($circleSize * 2)"/>

                <text text-anchor="middle" x="{$xSpacing * 2}" y="50" font-size="30">How are men, women, and mixed groups described across both editions?</text>
                <text text-anchor="middle" x="{$xSpacing * 2}" y="{300 + $circleSize + 95}" font-size="20" fill = "green">Green: Positive</text>
                <text text-anchor="middle" x="{$xSpacing * 2}" y="{300 + $circleSize + 120}" font-size="20" fill = "orange">Yellow: Neutral</text>
                <text text-anchor="middle" x="{$xSpacing * 2}" y="{300 + $circleSize + 145}" font-size="20" fill = "red">Red: Negative</text>

                <!-- Male descriptors -->
                <text text-anchor="middle" x="{$xSpacing * 1}" y="{300 + $circleSize + 50}">Male
                    Characters</text>
                <xsl:variable name="allMale" as="xs:integer"
                    select="count($editionOne//descriptor[@gender = 'male'])"/>

                <!-- draw the slices for men -->

                <!-- if theres no male actions in this anthology, display a grey circle to let the user know -->
                <xsl:choose>

                    <xsl:when test="$allMale eq 0">
                        <circle cx="{$xSpacing * 1}" cy="300" r="{$circleSize}" fill="grey"
                            stroke="black" stroke-width="1"/>
                        <text text-anchor="middle" x="{$xSpacing * 1}" y="300">There were no male
                            characters in this story</text>
                    </xsl:when>

                    <xsl:otherwise>

                        <!-- Positive (Since the other slices will cover up their share, we can make this one the full circle area) -->
                        <circle cx="{$xSpacing * 1}" cy="300" r="{$circleSize}" fill="green"
                            stroke="black" stroke-width="1"/>

                        <!-- Neutral -->
                        <xsl:variable name="neutMale" as="xs:integer"
                            select="count($editionOne//descriptor[@gender = 'male' and @type = 'neutral'])"/>
                        <xsl:if test="$neutMale ne 0">
                            <circle cx="{$xSpacing * 1}" cy="300" r="{$circleSize div 2}"
                                fill="none" stroke="yellow" stroke-width="{$circleSize}"
                                stroke-dasharray="{$circumference * $neutMale div $allMale div 2} 1000"/>
                            />
                        </xsl:if>

                        <!-- Negative -->
                        <xsl:variable name="negMale" as="xs:integer"
                            select="count($editionOne//descriptor[@gender = 'male' and @type = 'negative'])"/>
                        <xsl:if test="$negMale ne 0">
                            <g transform="matrix(1 0 0 -1 0 400) translate(0,-200)">
                                <circle cx="{$xSpacing * 1}" cy="300" r="{$circleSize div 2}"
                                    fill="none" stroke="red" stroke-width="{$circleSize}"
                                    stroke-dasharray="{$circumference * $negMale div $allMale div 2} {$circumference}"
                                />
                            </g>
                        </xsl:if>

                        <!-- clean outline -->
                        <circle cx="{$xSpacing * 1}" cy="300" r="{$circleSize}" fill="none"
                            stroke="black" stroke-width="2"/>


                    </xsl:otherwise>
                </xsl:choose>

                <!-- Female descriptors -->
                <xsl:variable name="allFemale" as="xs:integer"
                    select="count($editionOne//descriptor[@gender = 'female'])"/>
                <text text-anchor="middle" x="{$xSpacing * 2}" y="{300 + $circleSize + 50}">Female
                    Characters</text>

                <!-- draw the slices for women -->

                <!-- if theres no female actions in this anthology, display a grey circle to let the user know -->
                <xsl:choose>

                    <xsl:when test="$allFemale eq 0">
                        <circle cx="{$xSpacing * 2}" cy="300" r="{$circleSize}" fill="grey"
                            stroke="black" stroke-width="1"/>
                        <text text-anchor="middle" x="{$xSpacing * 2}" y="300">There were no female
                            characters in this story</text>
                    </xsl:when>

                    <xsl:otherwise>

                        <!-- Positive (Since the other slices will cover up their share, we can make this one the full circle area) -->
                        <circle cx="{$xSpacing * 2}" cy="300" r="{$circleSize}" fill="green"
                            stroke="black" stroke-width="1"/>

                        <!-- Neutral -->
                        <xsl:variable name="neutFemale" as="xs:integer"
                            select="count($editionOne//descriptor[@gender = 'female' and @type = 'neutral'])"/>
                        <xsl:if test="$neutFemale ne 0">
                            <circle cx="{$xSpacing * 2}" cy="300" r="{$circleSize div 2}"
                                fill="none" stroke="yellow" stroke-width="{$circleSize}"
                                stroke-dasharray="{$circumference * $neutFemale div $allFemale div 2} 1000"
                            />
                        </xsl:if>

                        <!-- Negative -->
                        <xsl:variable name="negFemale" as="xs:integer"
                            select="count($editionOne//descriptor[@gender = 'female' and @type = 'negative'])"/>
                        <xsl:if test="$negFemale ne 0">
                            <g transform="matrix(1 0 0 -1 0 400) translate(0,-200)">
                                <circle cx="{$xSpacing * 2}" cy="300" r="{$circleSize div 2}"
                                    fill="none" stroke="red" stroke-width="{$circleSize}"
                                    stroke-dasharray="{$circumference * $negFemale div $allFemale div 2} {$circumference}"
                                />
                            </g>
                        </xsl:if>

                        <!-- clean outline -->
                        <circle cx="{$xSpacing * 2}" cy="300" r="{$circleSize}" fill="none"
                            stroke="black" stroke-width="2"/>


                    </xsl:otherwise>
                </xsl:choose>


                <!-- Mixed descriptors -->
                <xsl:variable name="allMix" as="xs:integer"
                    select="count($editionOne//descriptor[@gender = 'mixed'])"/>
                <text text-anchor="middle" x="{$xSpacing * 3}" y="{300 + $circleSize + 50}">Mixed
                    Groups (both males and females)</text>
                
                <!-- draw the slices for mixed -->
                
                <!-- if theres no female actions in this anthology, display a grey circle to let the user know -->
                <xsl:choose>
                    
                    <xsl:when test="$allMix eq 0">
                        <circle cx="{$xSpacing * 3}" cy="300" r="{$circleSize}" fill="grey"
                            stroke="black" stroke-width="1"/>
                        <text text-anchor="middle" x="{$xSpacing * 3}" y="300">There were no mixed groups in this story</text>
                    </xsl:when>
                    
                    <xsl:otherwise>
                        
                        <!-- Positive (Since the other slices will cover up their share, we can make this one the full circle area) -->
                        <circle cx="{$xSpacing * 3}" cy="300" r="{$circleSize}" fill="green"
                            stroke="black" stroke-width="1"/>
                        
                        <!-- Neutral -->
                        <xsl:variable name="neutMix" as="xs:integer"
                            select="count($editionOne//descriptor[@gender = 'mixed' and @type = 'neutral'])"/>
                        <xsl:if test="$neutMix ne 0">
                            <circle cx="{$xSpacing * 3}" cy="300" r="{$circleSize div 2}"
                                fill="none" stroke="yellow" stroke-width="{$circleSize}"
                                stroke-dasharray="{$circumference * $neutMix div $allMix div 2} 1000"
                            />
                        </xsl:if>
                        
                        <!-- Negative -->
                        <xsl:variable name="negMix" as="xs:integer"
                            select="count($editionOne//descriptor[@gender = 'mixed' and @type = 'negative'])"/>
                        <xsl:if test="$negMix ne 0">
                            <g transform="matrix(1 0 0 -1 0 400) translate(0,-200)">
                                <circle cx="{$xSpacing * 3}" cy="300" r="{$circleSize div 2}"
                                    fill="none" stroke="red" stroke-width="{$circleSize}"
                                    stroke-dasharray="{$circumference * $negMix div $allMix div 2} {$circumference}"
                                />
                            </g>
                        </xsl:if>
                        
                        <!-- clean outline -->
                        <circle cx="{$xSpacing * 2}" cy="300" r="{$circleSize}" fill="none"
                            stroke="black" stroke-width="2"/>
                        
                    </xsl:otherwise>
                </xsl:choose>

            </g>
        </svg>
    </xsl:template>

</xsl:stylesheet>
