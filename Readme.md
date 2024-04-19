# Introduction

This is the repository for Week 3 project of SRE Fundamentals with Google Course.

# Task 1

Task 1 entails in implementing a "Red Button" for scaling down Swype Microservice if it has restarted couple times. 

The ```watcher.sh``` script checks the microservice restart count and downscales it after the microservice has restarted more than 5 times. 

# Task 2

The following tools can be utilized for reducing toil:

- **Shoreline**: It is an incident automation tool that is dedicated to identifying, debugging, and resolving production incidents. It leverages executable runbooks to automate solutions for an organisation's most frequent issues. It also provides automation for on-call responsibilities across an organisation's technology stack, applications, and services.

- **BigPanda**: It is an event managemet platform that enables faster resolution of incidents through multidimensional correlation and enrichment.

- **Data Dog Incident Managmeent**: It enables toil reduction by accelerating mean time to resolution of incidents. It provides a set of features enabling seamless pivoting of alerts and data to an organisation's incident response workflow. 