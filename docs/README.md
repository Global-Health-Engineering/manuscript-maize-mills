Manuscript Maize Mills
================

# Data Exploration

TODO List:

- Analyse peaks and exposure times based on the assumption that these
  are the only times that the machines are actually running and someone
  is inside the room

## Plot: Overview

![](README_files/figure-gfm/unnamed-chunk-5-1.png)

## Plot: Daily 24-hour average by date

![](README_files/figure-gfm/unnamed-chunk-6-1.png)

## Plot: Day time vs night time averages (6-18, 18-6)

![](README_files/figure-gfm/unnamed-chunk-7-1.png)

## Plot: Exposure in hours in categories of hazard

### Percent (US EPA)

![](README_files/figure-gfm/unnamed-chunk-8-1.png)

### Percent - (World Health Organization 2021)

![](README_files/figure-gfm/unnamed-chunk-9-1.png)

### Waffle plot - (World Health Organization 2021) (used)

![](README_files/figure-gfm/unnamed-chunk-10-1.png)

## Table: Peaks over the limit for hazardous ((World Health Organization 2021))

- Peak for PM2.5: \> 35 Greater interim target 1, Annual
- Peak for PM10: \> 70 Greater interim target 1, Annual
- Column peaks counts the number of data points (5 minute intervals
  between them) above these two limits over all days

| location |    n | pm10 | pm2.5 |
|:---------|-----:|-----:|------:|
| husk     | 1298 |   21 |    24 |
| top      | 1775 |  140 |   108 |
| window   | 1407 |   73 |    79 |

## Peaks over 424.9 for pm10 (limit for hazardous (US EPA))

| date       | hour | mean_pm10 |
|:-----------|-----:|----------:|
| 2021-04-08 |    5 |       480 |
| 2021-04-08 |    6 |       510 |
| 2021-04-08 |   22 |       872 |
| 2021-04-09 |   12 |       738 |
| 2021-04-09 |   18 |       685 |
| 2021-04-10 |   17 |       929 |
| 2021-04-10 |   23 |       763 |
| 2021-04-11 |    6 |       727 |
| 2021-04-12 |   13 |       776 |
| 2021-04-12 |   14 |       915 |
| 2021-04-12 |   20 |       592 |
| 2021-04-13 |    9 |       803 |
| 2021-04-13 |   12 |       811 |
| 2021-04-14 |    2 |       560 |
| 2021-04-14 |    3 |       755 |
| 2021-04-14 |   11 |       595 |
| 2021-04-14 |   12 |       783 |
| 2021-04-14 |   14 |       573 |

## Peaks over 250.4 for pm2.5 (limit for hazardous (US EPA))

| date       | hour | mean_pm25 |
|:-----------|-----:|----------:|
| 2021-04-08 |    4 |       302 |
| 2021-04-08 |    5 |       341 |
| 2021-04-08 |    6 |       329 |
| 2021-04-08 |   22 |       600 |
| 2021-04-09 |   12 |       481 |
| 2021-04-09 |   18 |       518 |
| 2021-04-09 |   20 |       303 |
| 2021-04-09 |   21 |       335 |
| 2021-04-10 |   17 |       671 |
| 2021-04-10 |   23 |       452 |
| 2021-04-11 |    5 |       278 |
| 2021-04-11 |    6 |       439 |
| 2021-04-12 |   13 |       417 |
| 2021-04-12 |   14 |       558 |
| 2021-04-12 |   20 |       452 |
| 2021-04-13 |    9 |       508 |
| 2021-04-13 |   12 |       662 |
| 2021-04-14 |    2 |       478 |
| 2021-04-14 |    3 |       531 |
| 2021-04-14 |   11 |       357 |
| 2021-04-14 |   12 |       561 |
| 2021-04-14 |   14 |       429 |

<div id="refs" class="references csl-bib-body hanging-indent">

<div id="ref-worldhealthorganization2021who" class="csl-entry">

World Health Organization. 2021. *WHO Global Air Quality Guidelines:
Particulate Matter (PM2.5 and PM10), Ozone, Nitrogen Dioxide, Sulfur
Dioxide and Carbon Monoxide*. World Health Organization.

</div>

</div>
