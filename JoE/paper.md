---
title: 'Responsible Datasets in Context'
tags:
  - Data
  - Datasheets
authors:
  - name: Melanie Walsh
    affiliation: "1, 2" # (Multiple affiliations must be quoted)
  - name: Author Without ORCID
    affiliation: 2
affiliations:
 - name: Lyman Spitzer, Jr. Fellow, Princeton University
   index: 1
 - name: University of Washington
   index: 2
date: 20 February 2025
bibliography: paper.bib

---

# Summary

Our project, [“Responsible Datasets in Context: Collaboratively Designing for Ethical Humanities Data Education”](https://www.responsible-datasets-in-context.com/), seeks to strengthen students’ capacity to work with data responsibly. We provide curated datasets that are carefully documented and paired with long-form essays, which both explore and interrogate each dataset’s construction, history, quirks, flaws, and strengths from different humanistic perspectives. We thus provide useable datasets and models for responsible data curation, documentation, story-telling, and analysis.

Beyond our specific educational goals, we also hope these datasets, essays, and accompanying materials will be useful and informative for the broader public. Our target audience is high school, undergraduate, or early graduate students in both the humanities and the social sciences.

Our current set of datasets include["US National Park Visit Data (1979-2023)"](https://www.responsible-datasets-in-context.com/posts/np-data/), ["Top 500 'Greatest' Novels (1021-2015)"](https://www.responsible-datasets-in-context.com/posts/top-500-novels/top-500-novels.html), ["African American Periodical Poetry (1900-1928)"](https://www.responsible-datasets-in-context.com/posts/african-american-periodical-poetry/aa-periodical-poetry.html), and ["Gender Violence at the Border (1993-1998)"](https://www.responsible-datasets-in-context.com/posts/gender-violence/).


# Statement of Need

Data cannot be analyzed responsibly without deep knowledge of its social and historical context, provenance, and limitations. Anyone who works with data—from academic researchers to industry professionals—will know this claim to be true. 

But despite its significance, social and historical knowledge and methodologies are one of the most neglected areas in undergraduate computing education. In classes, it is very common for students to use datasets that they find on websites like Kaggle, datasets that are poorly documented and that students thus don’t fully understand. This is a recipe for irresponsible data work and a bad habit that can become a dangerous habit as the stakes get higher. 

The motivation for our data essays is also in spired by "Datasheets for Datasets" `[@Gebru:2021]`  which argues that "every dataset be accompanied with a datasheet that documents its motivation, composition, collection process, recommended uses, and so on." Our data essays resemble these datasheets and do more, with a focus on sites of uncertainty and ambiguity within the datasets and the collection process. 

# Our Data Essays

The general structure of our data essays are inspired by Heather Krause’s concept of a data biography. 

A data essay will and should differ depending on the data it describes, but most of our data essays try to address the following questions:

What is the historical context of the data?
Where did the data come from? Who collected it?
Why was the data collected?
How was the data collected?
How is the data used?
What’s in the data?
What “counts” as a data point?
What data is missing?
How is uncertainty handled?


# Our Data Principles
Based on our work and conversations, we also offer the following principles to help guide ethically responsible dataset curation, consumption, and analysis:

## Tell the Data’s Story / Know the Data’s Story
As scholars like Johanna Drucker and others have been arguing for more than a decade, data is not simply objectively “there” in the world. Datasets have human-oriented stories behind them and implicit within them, and the stories of how and why data was created ought to be integrally connected to the datasets themselves.

What are the constraints of the source material? What material might be simply absent from the historical record, and how do those absences shape what data we can effectively construct? Also, where are there elements of uncertainty or fuzziness in the data? If choices had to be made regarding, for instance, the dating of a creative work, how were those choices made, and why?

## Provide Metadata / Understand Metadata
Metadata is often overlooked. But understanding what each data point and feature represents is fundamental to ethically responsible data work, so it is important to gives users a way to access and understand that metadata. Which categories were deemed important to catalog and measure, and which were excluded? If gender is an aspect of metadata, is gender only available under binarized categories? Is race included or discussed – and why?

## Touch Every Data Point
For creators and users of datasets, it is important to actually explore and try out datasets to make sure they’re accurate and glitch-free, and that they represent what we think they represent—in other words, it is important to actually open a dataset in Excel, Google Sheets, etc., and examine individual cells. When data is too large for these kinds of applications, it is important to examine individual data points in other ways. This is a basic yet surprisingly radical concept! It is especially important when we use automated processes to create datasets, like web scraping, which are also more likely to distance us from individual data points.

## Consider When Data Should Remain Off-Limits or Private
There is a growing movement in data science to think carefully about who can ethically access certain kinds of data. Representations of tribal rituals among indigenous communities are often only meant for members of those communities, so accessing photographs or other sorts of quantitative data about that traditional knowledge should probably be restricted. Projects like [Mukurtu](https://mukurtu.org/) have specifically addressed this issue and developed platforms where communities can choose who they share their data with.

Similarly, the editors of sites like the [Colored Conventions Project](https://coloredconventions.org/) have argued that data about enslaved people and their descendents has historically “served in the processes and recording of the destruction and devaluation of Black lives and communities.” They maintain that there is an urgent need to affirm “the Black humanity inherent in Black data/curation.” In other words, when data is about real people who may have been marginalized or oppressed, it is important that those people be named and recognized.

# Future Contributions

 // NEED TO DO

# References