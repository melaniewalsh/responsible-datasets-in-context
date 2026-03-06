---

title: **"Responsible Datasets in Context : Curated Resources for More Ethical, Humanistic Data Education"** tags:

- Data  
- Datasheets authors:  
- name: Melanie Walsh affiliation: 1  
- name: Anna Preus affiliation: 2  
- name: Amardeep Singh affiliation: 5  
- name: Sylvia Fernandez affiliation: 3  
- name: Miriam Posner affiliation: 4  
- name: Neel Gupta affiliation: 1 affiliations:  
- name: Information School, University of Washington index: 1  
- name: Department of English, University of Washington index: 2  
- name: Modern Languages and Literatures, The University of Texas at San Antonio index: 3  
- name: Department of Information Studies, University of California, Los Angeles index: 4  
- name: Department of English, Lehigh University index: 5 date: 4 March 2025 bibliography: paper.bib

---

# Summary

["Responsible Datasets in Context"](https://www.responsible-datasets-in-context.com/) is an online repository of datasets that are paired with rich documentation, data essays, and teaching resources, all of which foreground context and humanities perspectives and methods. Each dataset is accompanied by coding exercises in both Python and R, as well as discussion and activity prompts. The project provides usable datasets and models for responsible data curation, documentation, story-telling, and analysis. Our target audience is students at the graduate, undergraduate, and high school levels across the humanities, social sciences, and STEM. We also aim to make our resources accessible to the broader public.

Our repository continues to grow, but some current datasets include:

- ["Top 500 'Greatest' Novels"](https://www.responsible-datasets-in-context.com/posts/top-500-novels/top-500-novels.html) — metadata about novels from a composite "greatest novels" list, interrogating canon formation and whose voices are represented (Preus and Sheth)
- ["Library Checkouts for the Top 500 'Greatest' Novels"](https://www.responsible-datasets-in-context.com/posts/spl-500-novels/) — Seattle Public Library checkout data for the Top 500 novels, exploring how library circulation data reflects reading patterns and community interests (Gupta)
- ["African American Periodical Poetry"](https://www.responsible-datasets-in-context.com/posts/african-american-periodical-poetry/aa-periodical-poetry.html) — full-text poetry and metadata from early 20th-century African American periodicals, raising questions about digitization, metadata, and literary recovery (Singh and Hennessey)
- ["U.S. National Park Visit Data"](https://www.responsible-datasets-in-context.com/posts/np-data/) — visit counts for all U.S. National Parks, contextualized within the politics of government data and the fundamentally flawed nature of all data collection (Walsh and Keyes)
- ["Gender Violence at the Border"](https://www.responsible-datasets-in-context.com/posts/gender-violence/) — data about feminicides at the U.S.-Mexico border, digitized (by students) from _El Silencio Que La Voz De Todas Quiebra_ \[@benitez_silencio_1999\] (Fernández and Hernandez Trejo)
- ["A Historical Dataset of U.S. Governors"](https://www.responsible-datasets-in-context.com/posts/gubernatorial-bios/) — biographical data on 2,486 governors from 55 states and territories (1775-present), examining political representation and historical bias (White, Serlin, Gupta, and Scheve)

All materials are licensed under the [Creative Commons Attribution 4.0 (CC BY 4.0) License](https://creativecommons.org/licenses/by/4.0/).

# Statement of Need

We jokingly refer to our project as "the anti-Kaggle," not because we are actually opposed to [Kaggle](https://www.kaggle.com/datasets)—a popular website where users share and download datasets—but because we are opposed to some of the uncritical data habits that this website (often unintentionally) encourages in students.

In computing classes, students often turn to Kaggle to find data for assignments and projects. Kaggle is a valuable platform in many respects. It has fostered a large, engaged community, and it has worked toward its own forms of responsible curation and documentation over the years. But because of the way it is often used, Kaggle, in our view, has come to represent a broader culture of data work that is irresponsible and even harmful. This is a culture where data circulates with minimal documentation, little historical context, and brief if any discussion of ethical considerations.

We've seen students hurriedly download CSV or JSON files from the web and rush to feed them into the fanciest computational models, hoping to get results that will impress their teachers and future employers. But these analyses usually lack depth, impact, or even coherence because the students do not understand where the data came from, who collected it, why, or what might be missing. This is simply a recipe for sloppy data work, and a bad habit that becomes a dangerous habit as the stakes get higher.

We have seen these very same habits—the same carelessness about data—in developers and technicians working at the highest levels of the tech industry, producing technologies like AI models that impact nearly all of our lives. For example, leading AI models have accidentally included child sexual abuse material in their training data. \[@AmazonFoundHigh2026\] Another widely used dataset in AI model training, known as C4, included Russian propaganda websites and far-right news \[@dodgeDocumentingLargeWebtext2021; schaulSecretListWebsites\]. Copyrighted books, music, and journalism have also been scraped, sparking public controversy, lawsuits, as well as technical problems. According to the Data Provenance Initiative \[@longpre_data_2024\], there are in fact widespread data licensing problems and violations in the AI development space.

Data is clearly one of the most contested and consequential issues in contemporary society. Yet students are rarely taught to engage with these questions critically. While there are many reasons for this lack, one is that, from a pedagogical perspective, finding good datasets is hard. By "good" datasets, we mean datasets that lend themselves well to exploration and discussion from technical, ethical, and humanistic angles. By “hard” to find, we mean datasets that are very time-consuming and expensive to find or to create.

Responsible Datasets in Context grew out of this shared frustration. We set out to create an alternative—a collection of datasets that are not only technically rich but accompanied by the social and historical context needed to work with them responsibly. As Johanna Drucker \[@druckerHumanitiesApproachesGraphical2011\] and many others have argued, data is never simply "given." Datasets have stories behind them, and those stories are integrally connected to any use of the data.

In our "Mission Statement," we also advance several "data principles." For example, scholarship on Indigenous data sovereignty \[@christen_relationships_2018\] underscores that responsible data work must attend not only to documentation and provenance but also to the relational and ethical dimensions of who has the right to access, share, and benefit from data.

# Related Work

Our project builds on foundational work addressing dataset documentation, including Datasheets for Datasets \[@gebru_datasheets_2021\], Data Statements for NLP \[@bender_data_2018\], Model Cards for Model Reporting \[@mitchell_model_2019\], HuggingFace Dataset Cards \[@huggingface_dataset_cards_2024\], the FAIR Guiding Principles \[@wilkinson_fair_2016\], and Heather Krause's concept of "data biographies" \[@krause_data_2017\]. Cultural data collectives such as the Post45 Data Collective \[@post45_data_collective\] and the Nineteenth Century Data Collective \[@c19_data_collective\] also demonstrate models of community-driven data curation in the humanities.

We build on the model of "Datasheets for Datasets," \[@gebru_datasheets_2021\] which argues that every dataset should be accompanied by documentation of its motivation, composition, collection process, and recommended uses. We extend this model by drawing on history, literary studies, cultural and media studies, and critical theory to interrogate each dataset's story and stakes in ways that purely technical documentation cannot.

Throughout our essays, and in our data principles, we also seek to emphasize that some data should remain off-limits or private, and that the communities represented in data should have a meaningful say in how their data is shared and used \[@christen_relationships_2018\]. For example, the Colored Conventions Project \[@foreman_colored_conventions\] has argued that data about Black communities has historically served in the recording and devaluation of Black lives, and that there is an urgent need to affirm the humanity inherent in such data.

# Content and Instructional Design

Inspired by Krause's "data biographies" \[@krause_data_2017\], each data essay addresses questions such as: What is the historical context of the data? Who collected it, and why? What "counts" as a data point? What data is missing? How is uncertainty handled? Though data essays differ depending on the data it describes, these questions ground each essay's inquiry.

Alongside data essays, each resource includes coding exercises in Python and R that are designed around questions that emerge from the data and scholarship, as well as discussion activities that teach a humanistic approach to interpretation and analysis. These teaching materials encourage students to grapple with the ambiguity, historical contingency, context, uncertainty, and fundamentally flawed nature of data.

# Impact and Recognition

Supported by a Mozilla Responsible Computing Challenge grant \[@mozilla_rcc_2021\], Responsible Datasets in Context has reached more than 20,000 unique website visitors, over 500 students at more than seven institutions, and over 10 university library guides. The project received the American Studies Association Digital Project Award \[@PRESSRELEASEIMMEDIATE\] in 2025\. Our work has also been cited in publications spanning digital humanities, feminist studies, and AI ethics.

# References

# Acknowledgments

Our project was supported by a Mozilla Responsible Computing Challenge Award from 2023-2025. We are thankful to the students who collaborated with us on this project, including Juan Carlos Garcia, Katherine Hennessey, Paulina Hernandez Trejo, Os Keyes, and Aashna Sheth.
