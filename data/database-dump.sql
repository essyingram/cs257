--
-- PostgreSQL database dump
--

-- Dumped from database version 13.20
-- Dumped by pg_dump version 13.20

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: authors; Type: TABLE; Schema: public; Owner: ingrame
--

CREATE TABLE public.authors (
    id integer NOT NULL,
    surname text,
    given_name text,
    birth_year integer,
    death_year integer
);


ALTER TABLE public.authors OWNER TO ingrame;

--
-- Name: books; Type: TABLE; Schema: public; Owner: ingrame
--

CREATE TABLE public.books (
    id integer NOT NULL,
    title text,
    publication_year integer
);


ALTER TABLE public.books OWNER TO ingrame;

--
-- Name: books_authors; Type: TABLE; Schema: public; Owner: ingrame
--

CREATE TABLE public.books_authors (
    book_id integer,
    author_id integer
);


ALTER TABLE public.books_authors OWNER TO ingrame;

--
-- Name: characters; Type: TABLE; Schema: public; Owner: ingrame
--

CREATE TABLE public.characters (
    id integer NOT NULL,
    surname text,
    given_name text,
    species text,
    gender text,
    hair_color text,
    eye_color text,
    house text,
    occupation text,
    blood_status text,
    wand text,
    patronus text,
    skills text
);


ALTER TABLE public.characters OWNER TO ingrame;

--
-- Name: potions; Type: TABLE; Schema: public; Owner: ingrame
--

CREATE TABLE public.potions (
    id integer NOT NULL,
    name text,
    known_ingredients text,
    effect text,
    qualitative_traits text,
    difficulty text
);


ALTER TABLE public.potions OWNER TO ingrame;

--
-- Name: spells; Type: TABLE; Schema: public; Owner: ingrame
--

CREATE TABLE public.spells (
    id integer NOT NULL,
    informal_name text,
    incantation text,
    type text,
    effect text,
    light text
);


ALTER TABLE public.spells OWNER TO ingrame;

--
-- Data for Name: authors; Type: TABLE DATA; Schema: public; Owner: ingrame
--

COPY public.authors (id, surname, given_name, birth_year, death_year) FROM stdin;
0	Willis	Connie	1945	\N
1	Christie	Agatha	1890	1976
2	Morrison	Toni	1931	\N
3	Conger	Kate	1989	\N
4	Mac	Ryan	\N	\N
5	Lewis	Sinclair	1885	1951
6	Austen	Jane	1775	1817
7	Brontë	Charlotte	1816	1855
8	Wodehouse	P.G.	1881	1975
9	Márquez	Gabriel García	1927	2014
10	Kritzer	Naomi	1973	\N
11	Bujold	Lois McMaster	1949	\N
12	Melville	Herman	1819	1891
13	Sterne	Laurence	1713	1768
14	Osman	Richard	1970	\N
15	Brontë	Ann	1820	1849
16	Brontë	Emily	1818	1848
\.


--
-- Data for Name: books; Type: TABLE DATA; Schema: public; Owner: ingrame
--

COPY public.books (id, title, publication_year) FROM stdin;
0	All Clear	2010
1	And Then There Were None	1939
2	Beloved	1987
3	Blackout	2010
4	Character Limit	2024
5	Elmer Gantry	1927
6	Emma	1815
7	Jane Eyre	1847
8	Leave it to Psmith	1923
9	Love in the Time of Cholera	1985
10	Catfishing on Catnet	2019
11	Main Street	1920
12	Mirror Dance	1994
13	Moby Dick	1851
14	Murder on the Orient Express	1934
15	Omoo	1847
16	One Hundred Years of Solitude	1967
17	Pride and Prejudice	1813
18	Right Ho, Jeeves	1934
19	Liberty's Daughter	2023
20	Sense and Sensibility	1813
21	Shards of Honor	1986
22	Sula	1973
23	The Code of the Woosters	1938
24	The Life and Opinions of Tristram Shandy, Gentleman	1759
25	The Thursday Murder Club	2020
26	The Tenant of Wildfell Hall	1848
27	To Say Nothing of the Dog	1997
28	Villette	1853
29	The Man Who Died Twice	2021
30	Wuthering Heights	1847
\.


--
-- Data for Name: books_authors; Type: TABLE DATA; Schema: public; Owner: ingrame
--

COPY public.books_authors (book_id, author_id) FROM stdin;
0	0
1	1
2	2
0	3
3	4
4	4
5	5
6	6
7	7
8	8
9	9
10	10
5	11
11	12
12	13
1	14
12	15
9	16
6	17
8	18
10	19
6	20
11	21
2	22
8	23
13	24
14	25
15	26
0	27
7	28
14	29
16	30
\.


--
-- Data for Name: characters; Type: TABLE DATA; Schema: public; Owner: ingrame
--

COPY public.characters (id, surname, given_name, species, gender, hair_color, eye_color, house, occupation, blood_status, wand, patronus, skills) FROM stdin;
0	Potter	Harry James	Human	Male	Black	Bright green	Gryffindor	Student	Half-blood	11"  Holly  phoenix feather	Stag	Parseltongue| Defence Against the Dark Arts | Seeker
1	Weasley	Ronald Bilius	Human	Male	Red	Blue	Gryffindor	Student	Pure-blood	12" Ash unicorn tail hair 	Jack Russell terrier	Wizard chess | Quidditch goalkeeping
2	Granger	Hermione Jean	Human	Female	Brown	Brown	Gryffindor	Student	Muggle-born	10¾"  vine wood dragon heartstring	Otter	Almost everything
3	Dumbledore	Albus Percival Wulfric Brian	Human	Male	Silver| formerly auburn	Blue	Gryffindor	Headmaster	Half-blood	15" Elder Thestral tail hair core	Phoenix	Considered by many to be one of the most powerful wizards of his time
4	Hagrid	Rubeus	Half-Human/Half-Giant	Male	Black	Black	Gryffindor	Keeper of Keys and Grounds | Professor of Care of Magical Creatures	Part-Human(Half-giant)	16"  Oak unknown core	None	Resistant to stunning spells| above average strength | crossbowmanship
5	Longbottom	Neville	Human	Male	Blond	\N	Gryffindor	Student	Pure-blood	13" Cherry unicorn hair	Non-corporeal	Herbology
6	Weasley	Fred	Human	Male	Red	Brown	Gryffindor	Student	Pure-blood	\N	\N	Beater
7	Weasley	George	Human	Male	Red	Brown	Gryffindor	Student	Pure-blood	\N	\N	Beater
8	Weasley	Ginevra (Ginny) Molly	Human	Female	Red	Bright brown	Gryffindor	Student	Pure-blood	\N	Horse	Chaser| Bat-Bogey hex
9	Thomas	Dean	Human	Male	Black	Brown	Gryffindor	Student	Muggle-born	\N	\N	Chaser
10	Finnigan	Seamus	Human	Male	Sandy	\N	Gryffindor	Student	Half-blood	\N	Fox	Pyrotechnics
11	Potter	Lily J.	Human	Female	Auburn	Bright green	Gryffindor	\N	Muggle-born	10¼"  Willow  unknown core	Doe	\N
12	Potter	James	Human	Male	Black	Hazel	Gryffindor	\N	Pure-blood	11"  Mahogany  unknown core	Stag	Animagus| Seeker
13	Black	Sirius	Human	Male	Black	Grey	Gryffindor	\N	Pure-blood	\N	\N	Animagus| nonverbal magic| Charms
14	Lupin	Remus John	Werewolf	Male	Light brown flecked with grey	Green	Gryffindor	Professor of Defence Against the Dark Arts	Half-blood	10¼" Cypress unicorn hair	Wolf	Exceptionally gifted in Defence Against the Dark Arts
15	Pettigrew	Peter	Human	Male	Colorless and balding	Blue	Gryffindor	The Servant of Lord Voldemort	Half-blood or pure-blood	9¼" Chestnut dragon heartstring	None	Animagus
16	Weasley	Percy Ignatius	Human	Male	Red	Blue	Gryffindor	Student|Prefect|  Personal assistant to Barty Crouch Snr	Pure-blood	\N	\N	Intelligent| hard-working| a model student
17	Weasley	(Bill) William Arthur	Human(Werewolf traits)	Male	Red	Blue	Gryffindor	Curse-Breaker for Gringotts Bank	Pure-blood	\N	\N	Highly skilled curse-breaker for Gringotts Wizarding Bank| very intelligent| past Hogwarts Head Boy
18	Weasley	Charles	Human	Male	Red	Grey	Gryffindor	Dragonologist	Pure-blood	12"  Ash unicorn tail hair	\N	Highly skilled dragon trainer| one-time Gryffindor Seeker
19	Jordan	Lee	Human	Male	Black	Brown	Gryffindor	Student	Pure-blood or half-blood	\N	\N	Quidditch commentary | broadcasting
20	Wood	Oliver	Human	Male	\N	\N	Gryffindor	Student	Pure-blood or Half-blood	\N	\N	Keeper|  Captain of the Gryffindor Quidditch team
21	Johnson	Angelina	Human	Female	Brown	Brown	Gryffindor	Student	\N	\N	\N	Chaser
22	Bell	Katie	Human	Female	Brown	Brown	Gryffindor	Student	Pure-blood or half-blood	\N	\N	Chaser
23	Spinnet	Alicia	Human	Female	Brown	Brown	Gryffindor	Student	Pure-blood or half-blood	\N	\N	Chaser
24	Brown	Lavender	Human	Female	Blond	Blue	Gryffindor	Student	Pure-blood	\N	\N	Divination
25	Patil	Parvati	Human	Female	Dark	Dark	Gryffindor	Student	Pure-blood or half-blood	\N	\N	Divination
26	Vane	Romilda	Human	Female	Black	Dark	Gryffindor	Student	Pure-blood or half-blood	\N	\N	Spiking Chocolate Cauldrons with love potion
27	Creevey	Colin	Human	Male	Mousy	\N	Gryffindor	Student	Muggle-born	\N	\N	Photography
28	McLaggen	Cormac	Human	Male	Blond	\N	Gryffindor	Student	Pure-blood or half-blood	\N	\N	Quidditch Keeper
29	McGonagall	Minerva	Human	Female	Black	Green	Gryffindor	Professor of Transfiguration | Head of Gryffindor	Half-blood	9½" Fir dragon heartstring	Cat	Animagus
30	Weasley	Molly	Human	Female	Red	Bright brown	Gryffindor	\N	Pure-blood	\N	\N	Household spells| healing magic
31	Weasley	Arthur	Human	Male	Red	Green	Gryffindor	Head of the Misuse of Muggle Artifacts Office	Pure-blood	\N	Weasel	Muggle world works
32	Quirrell	Quirinus	Human	Male	\N	\N	Ravenclaw	Defence Against the Dark Arts(1991-1992)	Half-blood	9" Alder unicorn hair bendy	Non-corporeal	Learned in the theory of Defensive Magic| less adept in the practise
33	Chang	Cho	Human	Female	Black	Dark	Ravenclaw	Student	Pure-blood or half-blood	\N	Swan	Seeker
34	Lovegood	Luna	Human	Female	Dirty-blonde	Pale silvery	Ravenclaw	Student	Pure-blood or half-blood	\N	Hare	Spotting Nargles
35	Lockhart	Gilderoy	Human	Male	Blond	Blue	Ravenclaw	Defence Against the Dark Arts(1992-1993)	Half-blood	9" Cherry dragon heartstring	Non-corporeal	\N
36	Flitwick	Filius	Human(goblin ancestry)	Male	White	\N	Ravenclaw	Professor of Charms | Head of Ravenclaw	Part-Goblin	\N	Non-corporeal	Charms
37	Trelawney	Sybill Patricia	Human	Female	\N	\N	Ravenclaw	Professor of Divination	Half-blood	9 ½” hazel unicorn hair core	Non-corporeal	A Seer, though the gift is unpredictable and unconscious
38	Ollivander	Garrick	Human	Male	\N	Silvery	Ravenclaw	Wandmaker	Half-blood	12¾" Hornbeam dragon heartstring	Non-corporeal	An incomparable understanding of wandcraft
39	Myrtle)	Myrtle Elizabeth Warren (Moaning	Ghost	Female	\N	\N	Ravenclaw	Student	Muggle-born	\N	\N	\N
40	Patil	Padma	Human	Female	Dark	Dark	Ravenclaw	Student	Pure-blood or half-blood	\N	Non-corporeal	Prefect
41	Corner	Michael	Human	Male	Black	Brown	Ravenclaw	Student	Half-blood	\N	Squirrel	Potions
42	Edgecombe	Marietta	Human	Female	Reddish-blonde	Grey	Ravenclaw	Student	Pure-blood or half-blood	\N	\N	Covering up the spots that blight her face after betraying Dumbledore's Army
43	Boot	Terry	Human	Male	\N	\N	Ravenclaw	Student	Pure-blood or half-blood	\N	\N	Potions, also knowledgable about Charms
44	Goldstein	Anthony	Human	Male	Blonde	Grey	Ravenclaw	Student	Half-blood	\N	Non-corporeal	Prefect
45	Snape	Severus	Human	Male	Black	Black	Slytherin	Professor of Potions | Head of Slytherin	Half-blood	\N	Doe	Extremely skilled at potions and Occlumency
46	Malfoy	Draco	Human	Male	White-blond	Grey	Slytherin	Student	Pure-blood	10" Hawthorn unicorn hair	\N	Prefect, Seeker
47	Crabbe	Vincent	Human	Male	Black	Black	Slytherin	Student	Pure-blood	\N	\N	Beater
48	Goyle	Gregory	Human	Male	Brown	\N	Slytherin	Student	Pure-blood	\N	\N	Beater
49	Lestrange	Bellatrix	Human	Female	Black	\N	Slytherin	\N	Pure-blood	12¾" Walnut dragon heartstring	\N	She is a duellist of great skill and an experienced Occlumens
50	Umbridge	Dolores Jane	Human	Female	Iron grey	\N	Slytherin	Professor of Defence Against the Dark Arts | Department of Magical Law Enforcement	Half-blood	8" Birch dragon heartstring	Cat	Her punishment quill is of her own invention
51	Slughorn	Horace Eugene Flaccus	Human	Male	Bald	Gooseberry	Slytherin	Professor of Potions	Pure-blood or half-blood	10¼" Cedar dragon heartstring fairly flexible	Non-corporeal	Accomplished Occlumens, expert Potioneer, advanced self-transfiguration
52	Malfoy	Lucius	Human	Male	White-blond	Grey	Slytherin	School Governor	Pure-blood	Elm and dragon heartstring	\N	Skilled duellist and potioneer
53	Malfoy	Narcissa	Human	Female	Blonde	Blue	Slytherin	\N	Pure-blood	\N	\N	\N
54	Black	Regulus Arcturus	Human	Male	Black	\N	Slytherin	\N	Pure-blood	\N	Non-corporeal	Seeker
55	Parkinson	Pansy	Human	Female	\N	\N	Slytherin	Student	Pure-blood or half-blood	\N	\N	Prefect
56	Zabini	Blaise	Human	Male	Black	Brown	Slytherin	Student	Pure-blood or half-blood	\N	\N	Chaser
57	Riddle	Tom Marvolo	Human	Male	Bald	Scarlet	Slytherin	Student	Half-blood	13½" Yew phoenix feather core	\N	Dark Lord, Outstanding manipulation, Parseltongue, Heir of Slytherin, Dark magic, Inferi creation and control
58	Nott	Theodore	Human	Male	Brown	\N	Slytherin	Student	Pure-blood	\N	\N	\N
59	Lestrange	Rodolphus	Human	Male	Dark	Dark	Slytherin	\N	Pure-blood	\N	\N	\N
60	Bulstrode	Millicent	Human	Female	Black	\N	Slytherin	Student	Half-blood	\N	\N	\N
61	Montague	Graham	Human	Male	Brown	Brown	Slytherin	Student	Pure-blood or half-blood	\N	\N	Quidditch captain, Chaser
62	Baron	Bloody	Ghost	Male	\N	\N	Slytherin	Slytherin House Ghost	Pure-blood or half-blood	\N	\N	Controlling Peeves
63	Flint	Marcus	Human	Male	Black	\N	Slytherin	Student	Pure-blood or half-blood	\N	\N	Chaser, Captain
64	Clearwater	Penelope	Human	Female	Blonde	\N	Ravenclaw	Student	Muggle-born or half-blood[	\N	Non-corporeal	Prefect
65	Davies	Roger	Human	Male	Dark	Dark	Ravenclaw	Student	\N	\N	\N	Quidditch Captain, Chaser
66	Belby	Marcus	Human	Male	Brown	Dark	Ravenclaw	Student	Pure-blood or half-blood	\N	\N	\N
67	Slytherin	Salazar	Human	Male	Grey	Dark	Slytherin	Founder of Slytherin	Pure-blood	snakewood, Basilisk horn	\N	Accomplished Legilimens and one of the first recorded Parselmouths
68	Gryffindor	Godric	Human	Male	Red	Green	Gryffindor	Founder of Gryffindor	Pure-blood or half-blood	\N	\N	The most accomplished duellist of his time
69	Ravenclaw	Rowena	Human	Female	Black	Dark	Ravenclaw	Founder of Ravenclaw	Pure-blood or half-blood	\N	\N	Extremely skilled witch, known for her intelligence and wisdom
70	Mimsy-Porpington	Nicholas de	Ghost	Male	Grey	\N	Gryffindor	Gryffindor House Ghost	\N	\N	\N	\N
71	Binns	Cuthbert	Ghost	Male	White (balding)	Black	\N	Professor of History of Magic	\N	\N	\N	Boring a class with facts that might be interesting if anyone else was giving the lesson
72	Jr.	Barty Crouch	Human	Male	Straw blond	Pale, freckled	\N	Professor of Defence Against the Dark Arts (as Alastor Moody)	Pure-blood or half-blood	\N	\N	Skilled potioneer
73	Burbage	Charity	Human	Female	Blonde	\N	\N	Professor of Muggle Studies	Pure-blood or half-blood	\N	Non-corporeal	Teaching and studying the Muggle world
74	\N	Firenze	Centaur	Male	White-blond	Astonishingly blue	\N	Professor of Divination	\N	\N	\N	\N
75	Carrow	Alecto	Human	Female	\N	\N	Slytherin	Professor of Muggle Studies	Pure-blood or half-blood	\N	\N	Spreading anti-Muggle propaganda
76	Carrow	Amycus	Human	Male	\N	\N	Slytherin	Professor of Dark Arts	Pure-blood or half-blood	\N	\N	Cruciatus Curse
77	Hufflepuff	Helga	Human	Female	Brown	Blue	Hufflepuff	Founder of Hufflepuff	Pure-blood or half-blood	\N	\N	Food-related Charms. Many traditional Hogwarts recipes originated with her
78	Friar	Fat	Ghost	Male	Brown	\N	Hufflepuff	Hufflepuff House Ghost	\N	\N	\N	Curing peasants of the pox
79	Ravenclaw	Helena	Ghost	Female	Black	Grey	Ravenclaw	Ravenclaw House Ghost	Pure-blood or half-blood	\N	\N	\N
80	Tonks	Nymphadora	Human	Female	Variable	Variable	Hufflepuff	Auror	Half-blood	\N	Jack rabbit, Wolf	Talented Auror, Metamorphmagus
81	Sprout	Pomona	Human	Female	\N	Grey	Hufflepuff	Professor of Herbology | Head of Hufflepuff House	Pure-blood or half-blood	\N	Non-corporeal	Herbology
82	Scamander	Newton	Human	Male	Red brown	Blue	Hufflepuff	Employee in the Beast Division of the Department for the Regulation and Control of Magical Creatures	Pure-blood or half-blood	\N	\N	Magizoology, Order of Merlin, Second Class
83	Diggory	Cedric	Human	Male	Dark	Grey	Hufflepuff	Student	Pure-blood	12¼", Ash, unicorn hair	\N	Skilled Seeker
84	Finch-Fletchley	Justin	Human	Male	Red	\N	Hufflepuff	Student	Muggle-born	\N	Non-corporeal	\N
85	Smith	Zacharias	Human	Male	Blonde	\N	Hufflepuff	Student	Pure-blood or half-blood	\N	\N	Chaser
86	Abbott	Hannah	Human	Female	Blonde	Brown	Hufflepuff	Student	Half-blood	\N	Non-corporeal	Defensive spells, learned with Dumbledore's Army
87	Macmillan	Ernest	Human	Male	Blond	\N	Hufflepuff	Student	Pure-blood	\N	Boar	Revising, being a Prefect, getting the wrong end of the stick
88	Bones	Susan	Human	Female	\N	\N	Hufflepuff	Student	Half-blood	\N	\N	Defensive spells, learned with Dumbledore's Army
89	Macnair	Walden	Human	Male	Black	\N	Slytherin	Executioner for the Committee for the Disposal of Dangerous Creatures	Pure-blood or half-blood	\N	\N	Liaising with giants
90	Rookwood	Augustus	Human	Male	Brown/greying	\N	Slytherin	Unspeakable	Pure-blood or half-blood	\N	None	Spying for Lord Voldemort
91	Dolohov	Antonin	Human	Male	Dark	\N	Slytherin	Death Eater	Pure-blood or Half-blood	\N	None	Duelling. Fought and killed Molly Weasley's brothers and Remus Lupin
92	Yaxley	Corban	Human	Male	Blonde	Blue	Slytherin	Head of the Department of Magical Law Enforcement	Pure-blood or Half-blood	\N	None	Imperius curse, undercover work
93	Karkaroff	Igor	Human	Male	Silver| formerly black	\N	\N	Headmaster of Durmstrang Institute	Pure-blood or Half-blood	\N	None	Skilled in the Dark Arts
94	Shacklebolt	Kingsley	Human	Male	Bald	Black	\N	Auror  | Minister for Magic	Pure-blood	\N	Lynx	Exceptionally skilled duellist and Auror
95	Moody	Alastor	Human	Male	Grey	One dark, one electric blue	\N	Auror	Pure-blood	\N	Non-corporeal	A highly accomplished Auror and an outstanding duellist, also skilled in non-verbal magic
96	Longbottom	Alice	Human	Female	Blonde	\N	\N	Auror	Pure-blood	\N	\N	Auror
97	Longbottom	Frank	Human	Male	Blonde	\N	Gryffindor	Auror	Pure-blood	Inherited by his son, Neville. It was broken in battle at the Department of Mysteries.	\N	Auror
98	Scrimgeour	Rufus	Human	Male	Tawny	Yellowish	\N	Head of Auror Office| Minister for Magic	\N	\N	Non-corporeal	Highly regarded as a skilled Auror
99	Fudge	Cornelius Oswald	Human	Male	Grey	\N	\N	Minister for Magic	Pure-blood or Half-blood	\N	Non-corporeal	Turning a blind eye to the continuing threat of Dark Magic in the name of keeping up morale
100	Sr.	Barty Crouch	Human	Male	Grey	\N	\N	Head of the Department of International Magical Cooperation	Pure-blood	\N	Non-corporeal	Multilingual, able to fight the Imperius curse
101	Diggory	Amos	Human	Male	Brown	Ruddy	\N	Employee of the Department for the Regulation and Control of Magical Creatures[	Pure-blood or half-blood	\N	Non-corporeal	Works for the Department for the Regulation and Control of Magical Creatures
102	Diggle	Dedalus	Human	Male	\N	\N	\N	\N	Pure-blood or half-blood	\N	Non-corporeal	An enthusiastic volunteer for the Order and a helpful escort for Harry and his relatives
103	Doge	Elphias	Human	Male	Silver	Grey/Blue[	\N	Special Advisor to the Wizengamot	Pure-blood	\N	Non-corporeal	Writing
104	Delacour	Fleur Isabelle	Human	Female	Silvery-blonde	Dark blue[	Beauxbatons Academy of Magic	Part-time at Gringotts Wizarding Bank	Quarter-Veela	9½", Rosewood, veela hair	Non-corporeal	part Veela, and therefore possesses some of their magical powers. She was also selected to compete in the Triwizard Tournament
105	Dumbledore	Aberforth	Human	Male	Grey	Bright Blue	\N	Owner and Barman of the Hog's Head Inn	Half-blood	\N	Goat	Bartending, caring for Ariana
106	Fletcher	Mundungus	Human	Male	Ginger	Brown	\N	Dealer of wizarding artifacts	Half-blood[	\N	Non-corporeal	Gathering information for the Order, dealing in stolen cauldrons, 'acquiring' the odd Muggle car
107	Podmore	Sturgis	Human	Male	Straw-colored	Brown	\N	Advance Guard	Pure-blood or half-blood	\N	\N	Carrying out guard duty for the Order
108	Jones	Hestia	Human	Female	Black	\N	\N	Advance Guard	Pure-blood or half-blood	\N	\N	Carrying out escort missions for the Order
109	McKinnon	Marlene	Human	Female	Red	Brown	\N	\N	\N	\N	\N	\N
110	Prewett	Fabian	Human	Male	Red	Grey	\N	\N	Pure-blood	\N	\N	Duelling
111	Prewett	Gideon	Human	Male	Red	Dark Grey	\N	\N	Pure-blood	\N	\N	Duelling
112	Vance	Emmeline	Human	Female	\N	\N	\N	Advance Guard	\N	\N	\N	\N
113	Bones	Edgar	Human	Male	Reddish-brown	Grey	Hufflepuff	\N	Pure-blood or half-blood	\N	\N	Said to be a great wizard
114	Meadowes	Dorcas	Human	Female	Black	Brown	\N	\N	\N	\N	\N	\N
115	Fenwick	Benjy	Human	Male	Black	Black	\N	\N	\N	\N	\N	\N
116	Maxime	Madame Olympe	Half-Human/Half-Giant	Female	Brown	Black	Beauxbatons Academy of Magic	Headmistress of Beauxbatons Academy of Magic	Part-Human(Half-giant)	\N	\N	An 'excellent dancer', in the words of Dumbledore himself
117	Delacour	Gabrielle	Human	Female	Silvery-blonde	\N	Beauxbatons Academy of Magic	\N	Quarter-Veela	\N	\N	part Veela and therefore may possess some of their magical powers
118	Krum	Viktor	Human	Male	Dark	Dark	Durmstrang Institute	Seeker for the Bulgarian National Quidditch team	Pure-blood or half-blood	10¼", Hornbeam, dragon heartstring	\N	One of the best Seekers in the world
119	Dursley	Petunia	Human	Female	Blonde	\N	\N	\N	Muggle	\N	\N	\N
120	Dursley	Vernon	Human	Male	Black	\N	\N	Director at Grunnings	Muggle	\N	\N	Schmoozing clients, pretending magic doesn't exist
121	Dursley	Dudley	Human	Male	Blond	Blue	\N	\N	Muggle	\N	\N	\N
122	Dursley	Marge	Human	Female	Grey	\N	\N	Dog breeder	Muggle	\N	\N	Breeding bulldogs
123	Creevey	Dennis	Human	Male	Mousy brown	\N	Gryffindor	Student	Muggle-born	\N	\N	\N
124	Potter	Albus Severus	Human	Male	Jet-black	Bright green	Slytherin	Student	Half-blood	\N	\N	\N
125	Malfoy	Scorpius Hyperion	Human	Male	White blond	Grey	Slytherin	Student	Pure-blood	\N	\N	\N
126	Lupin	Edward Remus	Human(Metamorphmagus)	Male	Variable	Variable	Hufflepuff	Student	Half-blood	\N	\N	\N
127	Potter	James Sirius	Human	Male	\N	\N	Gryffindor	Student	Half-blood	\N	\N	\N
128	Granger-Weasley	Rose	Human	Female	Red	\N	Gryffindor	Student	Half-blood	\N	\N	Chaser
129	Filch	Argus	Human	Male	Grey	Pale	\N	Caretaker of Hogwarts	Squib	\N	\N	Sniffing out mischief
130	Pomfrey	Poppy	Human	Female	\N	\N	\N	Matron at Hogwarts School	Pure-blood or half-blood	\N	Non-corporeal	Skilled medical healer
131	Hooch	Rolanda	Human	Female	Grey	Yellow	\N	Flying Instructor at Hogwarts	\N	\N	Non-corporeal	Teaching, flying, refereeing Quidditch matches
132	Pince	Irma	Human	Female	\N	\N	\N	Librarian at Hogwarts	\N	\N	Non-corporeal	\N
133	Sinistra	Aurora	Human	Female	Dark	Dark	\N	Astronomer at Hogwarts	Pure-blood or half-blood	\N	\N	\N
134	Vector	Septima	Human	Female	Black	\N	\N	Professor of Arithmancyat Hogwarts	\N	\N	\N	\N
135	Grubbly-Plank	Wilhelmina	Human	Female	Grey	\N	\N	Substitute professor of Care of Magical Creatures at Hogwarts	\N	\N	Non-corporeal	\N
136	Greyback	Fenrir	Werewolf	Male	Grey	\N	\N	\N	\N	\N	None	Physical combat
137	Grindelwald	Gellert	Human	Male	Blond	Blue	\N	Revolutionary leader(c. 1920s[6] - 1945)	Pure-blood or half-blood	15", Elder, Thestral tail hair core	\N	Duelling
138	\N	Dobby	House elf	Male	Green	\N	\N	Malfoy family's house-elf (? - 1993), Hogwarts kitchens worker (December 1994 - 1998)	\N	\N	\N	A type of magic specific to house-elves, performed without a wand which includes the ability to apparate, disarm and make objects levitate
139	\N	Kreacher	House elf	Male	White	\N	\N	Black family's house-elf (?-1996), Harry Potter's house-elf, Hogwarts kitchen worker 	\N	\N	\N	Magic performed without a wand which includes the ability to apparate, disarm and make objects levitate
\.


--
-- Data for Name: potions; Type: TABLE DATA; Schema: public; Owner: ingrame
--

COPY public.potions (id, name, known_ingredients, effect, qualitative_traits, difficulty) FROM stdin;
0	Aging Potion	Newt spleens , Bananas	Ages drinker temporarily	Green	Advanced
1	Amortentia	\N	Love Potion that causes a powerful infatuation or obsession in the drinker	Mother-of-pearl sheen, Spiralling steam, Scent is multi-faceted and varies based on what the person likes	Advanced
2	Antidote to Veritaserum	\N	Counters the effect of Veritaserum	\N	\N
3	Babbling Beverage	Valerian sprigs, Aconite, Dittany	Causes the drinker to speak nonsense	\N	\N
4	Baruffio's Brain Elixir	Leaping Toadstools, Frog Brains, Runespoor eggs, Powdered dragon claw	Allegedly increases one's brain power	Green in color	\N
5	Befuddlement Draught	Scurvy grass, Lovage, Sneezewort	Recklessness	Dark green in color	\N
6	First Love Beguiling Bubbles	\N	Causes the drinker to become infatuated with the giver of the potion	\N	\N
7	Fire Protection Potion	Bursting mushrooms, Salamander blood, Wartcap powder	Protects drinker from fire	Purple or Black	Beginner
8	Tolipan Blemish Blitzer	Dragon claw	Treats acne	White in color, Thick paste consistency	\N
9	Blood-Replenishing Potion	\N	Replenishes lost blood	Dark red in color	\N
10	Bruise removal paste	\N	Heals bruises in an hour	Thick, yellow paste	\N
11	Bundimun Secretion	\N	Doxycide, Bundimun Pomade, Cleaning products	Lime green in color, Emits vapours	\N
12	Burn-healing paste	\N	Heals burns	Orange	\N
13	Calming Draught	\N	Calms the drinker	Blue in color	\N
14	Caxambu Style Borborygmus Potion	\N	Provokes stomach growling	\N	\N
15	Chelidonium Miniscula	Dark yellow in color	\N	\N	\N
16	Confusing Concoction	Scurvy grass, Lovage, Sneezewort	Confusion	\N	Simple to moderate
17	Cough potion	\N	Cures coughing	\N	\N
18	Cupid Crystals	\N	Causes the drinker to become infatuated with the giver of the potion	\N	\N
19	Cure for Boils	Dried nettles, 6 snake fangs, 4 horned slugs, 2 porcupine quills, Pungous Onions, Flobberworm Mucus, Ginger root, Shrake spines	Removes boils	Blue, Emits pink smoke	Beginner
20	Death potion	\N	Highly corrosive, death on contact	Black in color	Advanced
21	Deflating Draught	\N	Deflates the target	\N	\N
22	Developing solution	\N	Develops moving photographs	\N	\N
23	Doxycide	Bundimun Ooze, Streeler shells, Dragon liver, Hemlock essence, Tormentil tincture, Cowbane essence	Temporarily stuns Doxies so that the pests can be removed from a home	Black in color, Typically delivered as a spray	\N
24	Dr Ubbly's Oblivious Unction	\N	Heals wounds left by thoughts	\N	\N
25	Draught of Living Death	Standard potioning water, Powdered Root of Asphodel, Infusion of Wormwood, Valerian root, A Sopophorous bean, A Sloth brain	Causes the drinker to fall into a deep, death-like slumber	Turns pale lilac color then clear	Advanced
26	Draught of Peace	Powdered moonstone, Syrup of Hellebore, Powdered Unicorn horn, Powdered Porcupine quills	Relieves anxiety	Light silver color and vapour	Advanced
27	Potion for Dreamless Sleep	\N	Drowsiness , dreamless sleep	Purple in color	\N
28	Emerald Potion	Emerald green in color, Glows phosphorescently	Induces fear, delirium, intense stomach pain and extreme thirst in the drinker	\N	\N
29	Elixir of Life	Philosopher's Stone	Immortality	\N	\N
30	Elixir to Induce Euphoria	Shrivelfig, Porcupine quills, Peppermint sprigs, Sopophorous beans, Wormwood	Induces happiness	Sunshine yellow in color, Sweet, Aromatic, Emits rainbow when finished	Advanced
31	Everlasting Elixirs	\N	\N	\N	\N
32	Essence of Insanity	\N	\N	\N	\N
33	Fake protective potions	Bubotuber Pus, Gravy	Supposedly protect the drinker from the effects of dark magic (likely useless)	Fraudulent solutions	Beginner
34	Felix Felicis	Ashwinder egg, Squill bulb, Murtlap tentacle, Tincture of thyme, Occamy eggshell, Powdered common rue	Makes the drinker lucky, Giddiness and recklessness with overuse, Extremely toxic in large quantities, Highly disastrous if brewed incorrectly	Droplets leap like goldfish above potion's surface when in cauldron	Advanced
35	Fergus Fungal Budge	Onion juice, Jewelweed, Neem oil	Treats ringworm, fungicide, Potential negative side effects if used by elves	\N	\N
36	Flesh-Eating Slug Repellent	Repels Flesh-Eating Slugs	\N	\N	\N
37	Forgetfulness Potion	2 drops of Lethe River Water, 2 Valerian sprigs, 2 measures of Standard Ingredient, 4 mistletoe berries	Memory loss	Orange in color	Beginner
38	Garrotting Gas	\N	Causes choking, possibly suffocation	Colorless	\N
39	Hair-Raising Potion	Rat tails, Porcupine quills, Billywig stings	Raises hair up on end	Green color	\N
40	Heartbreak Teardrops	\N	Causes the drinker to become infatuated with the giver of the potion	Red in color	\N
41	Herbicide Potion	Flobberworm mucus, Horklump juice, Lionfish spines, Standard Ingredient	Kills or damages plants	Green	Advanced
42	Hiccoughing Solution	\N	Presumably causes hiccoughs	\N	\N
43	Invigoration Draught	Alihotsy leaves, Dried billywig stings, Peppermint, Stewed Mandrake, Infusion of Wormwood,\nHoneywater, Vervain, infusion, Scurvy grass, Lovage	Energises the drinker	Orange	O.W.L. level
44	Kissing Concoction	\N	Causes the drinker to become infatuated with the giver of the potion	\N	\N
45	Laxative Potion	Two scrumples of an unknown ingredient, An ingredient used in a furnace, Agrimonia	Laxative	\N	\N
46	Love Potion Antidote	Wiggentree twigs, Castor oil, Extract of Gurdyroot	Serves as an antidote for Love Potion	Clear, colorless	\N
47	Madame Glossy's Silver Polish	\N	Polishes silver objects	\N	\N
48	Mandrake Restorative Draught	Stewed Mandrake	Returns transfigured or cursed individuals to their original state	\N	\N
49	Mouth Itching Antidote	Pale green in color	Cures mouth itching	\N	\N
50	Mrs Skower's All-Purpose Magical Mess Remover	\N	Cleans stains	Strong acrid odour	\N
51	Murtlap Essence	Murtlap tentacles	Soothes and heals cuts and abrasions	Blue in color	\N
52	Pepperup Potion	Bicorn horn, Mandrake root	Warms up the recipient and cures common cold, Steam emits from drinker's ears	\N	\N
53	Polyjuice Potion	Lacewing flies (stewed 21 days), Leeches, Powdered bicorn horn, Knotgrass, Fluxweed (picked at full moon), Shredded Boomslang skin, A bit of the person one wants to turn into (typically hair)	Allows a human drinker to temporarily assume the form of another person	Before addition of final ingredient: Thick and mud-like, Bubbles slowly\nAfter addition of final ingredient: Taste and color vary depending on the person being turned into	Advanced
54	Rat tonic	\N	Healing potion for rats, Abnormal growth of the rat if too much is drunk	Green-colored	\N
55	Regeneration potion	Bone of the father, Flesh of a servant, Blood of a foe	Helps restore non-corporeal wizards to their bodies	\N	Advanced
56	Rudimentary body potion	Snake venom, Unicorn blood	Helps restore non-corporeal wizards to a rudimentary bodies/sustains rudimentary bodies	\N	Advanced
57	Shrinking Solution	Minced daisy roots, Peeled Shrivelfig, Sliced caterpillars, One rat spleen, A dash of leech juice, A splash of cowbane, Wormwood	Causes living beings to shrink to a smaller form	Acid green in color	\N
58	Skele-Gro	1 Chinese Chomping Cabbage, 3 Puffer-fish, 5 Scarab beetles	Restores bones	Smokes when poured, Vile taste, Burns on the way down	Above second year
59	Sleekeazy's Hair Potion	Gomas Barbadensis, Asian Dragon Hair, Petroleum Jelly	Makes hair more manageable	\N	\N
60	Sleeping Draught	4 sprigs of Lavender, 6 measures of Standard Ingredient, 2 blobs of Flobberworm Mucus, 4 Valerian sprigs	Make the drinker quickly fall into a deep but temporary sleep	Dark Purple	Advanced
61	Strengthening Solution	Salamander blood, Powdered  Griffin claw	Superhuman strength	Turquoise in color	Moderate to advanced
62	Swelling Solution	Puffer-fish eyes, Dried nettle, Bat spleens	Causes enlargement on contact	\N	Beginner
63	Ten-Second Pimple Vanisher	\N	Treats boils, pimples, blackheads and acne	\N	\N
64	Thick golden potion	\N	Healing, curse quarantining	Golden in color	\N
65	Truth serum	Jobberknoll feathers	Drinker tells the truth	\N	\N
66	Veritaserum	\N	Forces drinker to speak the truth	Clear and odourless like water	Advanced
67	Weedosoros	\N	Highly poisonous	Deep brown in color	\N
68	Wideye Potion	6 snake fangs, 4 measures of Standard Ingredient, 6 dried Billywig stings,  2 sprigs of Wolfsbane	Prevents sleeping, Awakens victim	\N	Beginner
69	Wit-Sharpening Potion	Ground scarab beetles, Cut ginger roots, Armadillo bile	Improves intellect	Purple in color	Moderate
70	Wolfsbane Potion	Wolfsbane	Eases the symptoms of lycanthropy; prevents werewolves from losing their minds post-transformation.	Faint blue smoke when completed, Unpleasant taste	Advanced
71	Wound-cleaning potion	\N	Antiseptic	Purple liquid, Smokes on contact, Stings on contact	\N
\.


--
-- Data for Name: spells; Type: TABLE DATA; Schema: public; Owner: ingrame
--

COPY public.spells (id, informal_name, incantation, type, effect, light) FROM stdin;
0	Summoning Charm	Accio	Charm	Summons an object	None
1	Age Line	\N	Charm	Prevents people above or below a certain age from access to a target	Blue
2	Water-Making Spell	Aguamenti	Charm, Conjuration	Conjures water	Icy blue
3	Launch an object up into the air	Alarte Ascendare	Charm	Rockets target upward	Red
4	Albus Dumbledore's Forceful Spell	\N	Spell	Great Force	None
5	Unlocking Charm	Alohomora	Charm	Unlocks target	Invisible, blue, yellow, or purple
6	Healing Spell	Anapneo	Healing spell, Vanishment	Clears airway	\N
7	Hex that grows antlers on the head	Anteoculatia	Hex	Grows antlers on head	Red
8	Anti-Cheating Spell	\N	Charm	Prevents cheating	Purple
9	Anti-Disapparition Jinx	\N	Jinx	Prevents Disapparition within a certain area	\N
10	Anti-intruder jinx	\N	Jinx	Repels intruders	\N
11	Antonin Dolohov's curse	\N	Curse	Injuries capable of killing	Purple
12	Revealing Charm	Aparecium	Charm	Reveals hidden writing	\N
13	Tracking spell	Appare Vestigium	Charm	Reveals traces of magic, including footprints and track marks	Swirl of gold
14	Apparition	None	Transportation	Magically transports the caster	None
15	Aqua Eructo Charm	Aqua Eructo	Charm	Jet of water	Ice Blue
16	Spider repelling spell	Arania Exumai	Spell	Repels spiders	Blue
17	Slowing Charm	Arresto Momentum	Charm	Slows or stops target's velocity	None
18	Arrow-shooting spell	\N	Conjuration	Fires arrows from the caster's wand	\N
19	Ascendio	Ascendio	Charm	Lifts caster	None
20	Killing Curse	Avada Kedavra	Curse	Instantaneous death	Green
21	Avifors Spell	Avifors	Transfiguration	Transforms the target into a bird.	Blue
22	Avenseguim	Avenseguim	Charm	Turns object into tracking device	Orange
23	Bird-Conjuring Charm	Avis	Conjuration, Charm	Conjures birds	Blue
24	Babbling Curse	\N	Curse	Uncontrollable babbling	\N
25	Badgering	\N	Transfiguration	Turns target human into a badger	\N
26	Bat-Bogey Hex	\N	Hex	Transforms target's bogeys into bats	\N
27	Baubillious	Baubillious	Charm	Jet of white sparks	White
28	Bedazzling Hex	\N	Hex	Disguises things	\N
29	Bewitched Snowballs	\N	Charm	Charms snowballs to follow and harass a designated target	\N
30	Bluebell Flames	\N	Charm	Conjures bluebell flames	Bright blue
31	Blue sparks	\N	Charm	Jet of blue sparks	Blue
32	Exploding Charm	Bombarda	Charm	Small explosion	None
33	Exploding Charm 2	Bombarda Maxima	Charm	Powerful explosion	White
34	Brackium Emendo	Brackium Emendo	Healing spell, Charm	Mends bones	Blue
35	Bravery Charm	\N	Charm	Enhances teammates against foes	\N
36	Bridge-conjuring spell	\N	Conjuration	Conjures bridges	None
37	Broom jinx	\N	Jinx	Makes a broomstick attempt to buck its rider off	\N
38	Bubble-Head Charm	\N	Charm	Creates bubble protecting the head	\N
39	Bubble-producing spell	\N	Conjuration	Creates a stream of non-bursting bubbles	None
40	Hair Loss Curse	Calvorio	Curse	Removes victim's hair	Red or Purple
41	Cantis	Cantis	Jinx	Makes target sing	Pink
42	Extension Charm	Capacious extremis	Charm	Increases interior space	\N
43	Seize and Pull Charm	Carpe Retractum	Charm	Pull caster towards object, Pull object towards caster	Orange or Purple
44	Cascading Jinx	\N	Jinx	Attacks multiple enemies	Blue
45	Caterwauling Charm	\N	Charm	Sets off a high-pitched shriek if entered	\N
46	Cauldron to Sieve	\N	Transfiguration	Turns a cauldron into a sieve	\N
47	Cauldron to badger	\N	Transformation	Transforms a cauldron into a badger.	\N
48	Cave inimicum	Cave inimicum	Charm	Concealment	None
49	Cheering Charm	\N	Charm	Creates joy	\N
50	Circumrota	Circumrota	Charm	Rotates an object	\N
51	Cistem Aperio	Cistem Aperio	Charm	Opens chests	White
52	Locking Spell	Colloportus	Charm	Locks doors	None
53	Stickfast Hex	Colloshoo	Hex	Sticks shoes to floor	\N
54	Color Change Charm	Colovaria	Charm	Changes color	Red
55	Blasting Curse	Confringo	Curse	Explosion	Fiery Orange
56	Confundus Charm	Confundo	Charm	Confuses the target	Pink
57	Conjunctivitis Curse	\N	Curse	Irritates eyes	\N
58	Cornflake skin spell	\N	Dark charm	Makes skin appear like cornflakes	\N
59	Cracker Jinx	\N	Jinx	Conjures exploding Wizard Crackers	\N
60	Cribbing Spell	\N	Spell	Assists the caster in cheating on written papers.	\N
61	Crinus Muto	Crinus Muto	Transfiguration	Transforms hair	White
62	Cruciatus Curse	Crucio	Curse	Excruciating pain	Red or None
63	Gouging Spell	Defodio	Charm	Carves through material	\N
64	Eradication Spell	Deletrius	Charm, Counter-charm	Erases image from Reverse Spell	None
65	Densaugeo	Densaugeo	Hex	Elongates teeth	Violet
66	Deprimo	Deprimo	Charm	Blasts holes in ground	Green
67	Banishing Charm	Depulso	Charm	Sends target away	White or Red
68	Descendo	Descendo	Charm	Lowers target	Blue
69	Desk Into Pig	\N	Transfiguration	Transfigures desks into pigs	\N
70	Deterioration Hex	\N	Hex	Impairs foes	\N
71	Severing Charm	Diffindo	Charm	Cuts objects	Light green, pink or red
72	Diminuendo	Diminuendo	Charm	Shrinks objects	White
73	Dissendium	Dissendium	Charm	Reveals secret passages	None
74	Disillusionment Charm	\N	Charm	Disguises target as surroundings	White
75	Draconifors Spell	Draconifors	Transfiguration	Turns object into dragon	Fiery orange
76	Drought Charm	\N	Charm	Dries up small bodies of water	\N
77	Ducklifors Jinx	Ducklifors	Transfiguration, Jinx	Turns organisms to ducks	Yellow or Purple
78	Hardening Charm	Duro	Charm	Turns object to stone	None
79	Ears to kumquats	\N	Transfiguration	Transfigures target's ears into kumquats	\N
80	Ear-shrivelling Curse	\N	Curse	Causes ears to wither	\N
81	Ebublio Jinx	Ebublio	Jinx	Traps target in giant bubble	Blue
82	Engorgement Charm	Engorgio	Charm	Causes swelling	Icy blue
83	Engorgio Skullus	Engorgio Skullus	Hex	Swells head	Red or Purple
84	Insect Jinx	Entomorphis	Transfiguration Jinx	Turns into insect	Red or Purple
85	Entrail-Expelling Curse	\N	Curse	Expels entrails	\N
86	Epoximise	Epoximise	Transfiguration spell	Bonds two objects	\N
87	Erecto	Erecto	Charm	Erects a structure	None
88	Evanesce	Evanesce	Transfiguration	Vanishes objects	Bluish-white
89	Vanishing Spell	Evanesco	Transfiguration	Vanishes things	None
90	Everte Statum	Everte Statum	Charm	Makes opponent stumble, Causes sharp pain	Orange
91	Patronus Charm	Expecto Patronum	Charm	Conjures a spirit guardian	Silver
92	Disarming Charm	Expelliarmus	Charm	Disarms an opponent	Scarlet
93	Expulso Curse	Expulso	Curse	Blows things up	Blue
94	Extinguishing Spell	\N	Charm	Extinguishes fires	\N
95	False memory charm	\N	Charm	Implants a false memory in the victim	\N
96	Feather-light charm	\N	Charm	Minimises object's weight	\N
97	Ferret to human	\N	Transfiguration	Changes ferrets into humans	None
98	Bandaging Charm	Ferula	Healing Spell, Charm, Conjuration	Bandages target	\N
99	Fianto Duri	Fianto Duri	Charm	Most likely hardens magical shields	Blueish white
100	Fidelius Charm	\N	Charm	Conceals a secret	\N
101	Fiendfyre	\N	Curse	Unleashes cursed fire	Fire
102	Finestra spell	Finestra	Charm	Shatters glass	Blue
103	General Counter-Spell	Finite	Counter-spell	Terminates all spell effects	Red
104	Finger-removing jinx	\N	Jinx	Removes a person's fingers	\N
105	Firestorm	\N	Charm	Ring of fire	Crimson and gold
106	Flagrante Curse	Flagrante	Curse	Causes objects to burn on contact	\N
107	Flagrate	Flagrate	Charm	Writes in midair	Fiery scarlet
108	Flame-Freezing Charm	\N	Charm	Makes fire harmless	White
109	Flask-conjuring spell	\N	Conjuration	Conjures flask	None
110	Flintifors	Flintifors	Transfiguration	Turns target into matchboxes	\N
111	Knockback Jinx	Flipendo	Jinx	Knocks target back	Blue
112	Knockback Jinx Duo	Flipendo	Jinx	Knocks target back	Red
113	Flipendo Tria	Flipendo Tria	Jinx	More powerful version of Flipendo	Blue
114	Flying Charm	\N	Charm	Allows an object to fly	\N
115	Smokescreen Spell	Fumos	Charm	Defensive smokescreen	Grey
116	Fumos Duo	Fumos Duo	Charm	Multiple concealing smokescreens	Dark Red
117	Pimple Jinx	Furnunculus	Jinx	Causes pimples to erupt	Gold
118	Fur spell	\N	Charm	Causes fur to grow on someone	\N
119	Doubling Charm	Geminio	Charm	Duplicates an object	None
120	Freezing Spell	Glacius	Charm	Freezes target	Blue
121	Glacius Duo	Glacius Duo	Charm	Freezes the target	Blue
122	Glacius Tria	Glacius Tria	Charm	Freezes target enemy	Blue
123	Glisseo	Glisseo	Charm	Turns stairs into a slide	None
124	Green Sparks	\N	Charm	Jet of green sparks	Green
125	Gripping Charm	\N	Charm	Makes holding easier	\N
126	Hair-thickening Charm	\N	Charm	Causes hair to grow longer and thicker	\N
127	Harmonia Nectere Passus	Harmonia Nectere Passus	Charm	Repairs Vanishing Cabinets	None
128	Herbifors Spell	Herbifors	Transfiguration	Transforms target into flowers	Red or Purple
129	Herbivicus Charm	Herbivicus	Charm	Rapidly grows plants	Green
130	Dumbledore's Army parchment jinx	\N	Jinx	Causes boils to spell "SNEAK" on the face of a traitor	\N
131	Homing spell	\N	Dark Arts	Offensive spells; will follow their target	Orange or Green
132	Human Presence Revealing Spell	Homenum Revelio	Charm	Reveals human presence	None
133	Homonculous Charm	\N	Charm	When cast onto a map, it enables to track the movements of every person in the mapped area	\N
134	Homorphus Charm	\N	Charm	May temporarily change a transformed werewolf back into their human form (according to Gilderoy Lockhart, it cures lycanthropy)	\N
135	Horn tongue hex	\N	Hex	Transforms target's tongue into a horn	\N
136	Horton-Keitch Braking Charm	\N	Charm	Allow broomsticks to brake more easily	\N
137	Horcrux-making spell	\N	Dark Arts	Prepared a receptacle to become a Horcrux	\N
138	Hot-Air Charm	\N	Charm	Jet of hot air	None
139	Hour-Reversal Charm	\N	Charm	Reverses time	Blue
140	Hover Charm	\N	Charm	Makes objects hover	Pink
141	Hurling Hex	\N	Hex	Unclear, possibly causes a broomstick to attempt to hurl its rider off.	\N
142	Illegibilus	Illegibilus	Charm	Makes text illegible	\N
143	Freezing Charm	Immobulus	Charm	Stops movement and actions of the target	Blue
144	Impediment Jinx	Impedimenta	Jinx	Hinders movement	Turquoise
145	Imperius Curse	Imperio	Curse	Total control over the victim	None
146	Imperturbable Charm	\N	Charm	Invisible barrier	\N
147	Impervius Charm	Impervius	Charm	Waterproofs an object	None
148	Inanimatus Conjurus Spell	\N	Transfiguration	Presumably conjuresinanimate objects	\N
149	Incarcerous Spell	Incarcerous	Conjuration	Binds target in ropes	None
150	Fire-Making Spell	Incendio	Charm	Conjures flames	Orange and Red
151	Incendio Duo Spell	Incendio	Charm	Conjures flames	Green
152	Incendio Tria	Incendio Tria	Charm	Conjures blue flames	Blue
153	Inflating Charm	Inflatus	Charm	Inflates target	Blue
154	Informous Spell	Informous	Charm	Adds to the Folio Bruti	Blue
155	Instant Scalping Hex	\N	Hex	Instantly scalps hair	\N
156	Intruder Charm	\N	Charm	Detects intruders and sounds an alarm	\N
157	Jelly-Legs Curse	Locomotor Wibbly	Curse, Jinx	Legs become wobbly	Orange
158	Jelly-Brain Jinx	\N	Jinx	Dulls mental abilities	\N
159	Jelly-Fingers Curse	\N	Curse	Fingers become wobbly	\N
160	Knee-reversal hex	\N	Hex	Puts knees on backward	\N
161	Lacarnum Inflamari	Lacarnum Inflamari	Charm	Ignites cloaks	Orange
162	Langlock	Langlock	Jinx	Sticks tongue to roof of the mouth	None
163	Lapifors Spell	Lapifors	Transfiguration	Turns target into rabbit	Green
164	Leek jinx	\N	Jinx	Leeks sprout from ears	\N
165	Legilimency Spell	Legilimens	Charm	Lets caster see into the mind of another person	Psychadelic transparent wave
166	Levicorpus	Levicorpus	Jinx	Suspends people by the ankles	Green
167	Liberacorpus	Liberacorpus	Counter-jinx	Counteracts Levicorpus	None
168	Locomotion Charm	Locomotor	Charm	Moves objects in midair	None
169	Leg-Locker Curse	Locomotor Mortis	Curse	Sticks legs together	Purple
170	Wand-Lighting Charm	Lumos	Charm	Illuminates the wand tip	White
171	Wand-Lighting Charm Duo	Lumos Duo	Charm	Focused beam of light	White
172	Lumos Maxima	Lumos Maxima	Charm	Produces bright light	White
173	Lumos Solem Spell	Lumos Solem	Charm	Produces sunlight	Bright yellow
174	Magicus Extremos	Magicus Extremos	Charm	Temporarily increases casters' spell power	Pink
175	Melofors Jinx	Melofors	Conjuration, Jinx	Encases head in pumpkin	Orange
176	Meteolojinx Recanto	Meteolojinx Recanto	Counter-charm	Causes weather effects caused by incantations to cease	None
177	Tongue-Tying Curse	Mimblewimble	Curse	Ties tongue in knot	Blue
178	Ministry of Magic Fog	\N	Patented Charm	Produces special fog (for concealment of certain locations)	\N
179	Mobiliarbus	Mobiliarbus	Charm	Levitates wooden things	Blue
180	Mobilicorpus	Mobilicorpus	Charm	Moves bodies	None
181	Cushioning Charm	Molliare	Charm	Invisible cushion	\N
182	Dark Mark	Morsmordre	Curse	Conjures Dark Mark	Green
183	Curse of the Bogies	Mucus ad Nauseam	Curse	Nasty cold & runny nose	Green
184	Muffliato Charm	Muffliato	Charm	Conceals sound	None
185	Multicorfors Spell	Multicorfors	Transfiguration	Changes clothes	Red
186	Mutatio Skullus	Mutatio Skullus	Hex	Grows extra heads	\N
187	Wand-Extinguishing Charm	Nox	Charm	Extinguishes wandlight	\N
188	Nebulus	Nebulus	Charm	Conjures fog	Grey
189	Oculus Reparo	Oculus Reparo	Charm	Repairs glasses	None
190	Obliteration Charm	\N	Charm	Removes footprints	\N
191	Memory Charm	Obliviate	Charm	Erases memories	Green
192	Obscuro	Obscuro	Conjuration	Blindfolds target	None
193	Oppugno Jinx	Oppugno	Jinx	Assaults target with directed object(s)	None
194	Orbis Jinx	Orbis	Jinx	Sucks the target into the ground	Blue
195	Orchideous	Orchideous	Conjuration	Conjures flowers	Pink
196	Oscausi	Oscausi	Dark charm	Seals mouth	White
197	Pack	Pack	Charm	Packs luggage	None
198	Papyrus Reparo	Papyrus Reparo	Charm	Mends torn paper	None
199	Patented Daydream Charm	\N	Charm	Makes the user daydream for 30 minutes	\N
200	Partis Temporus	Partis Temporus	Charm	Parts the target	None
201	Pepper breath hex	\N	Hex	Inflicts fiery hot breath	\N
202	Periculum	Periculum	Charm	Burst of red sparks	Red
203	Permanent Sticking Charm	\N	Charm	Sticks object permanently in place	\N
204	Peskipiksi Pesternomi	Peskipiksi Pesternomi	Charm	Nothing (supposedly captures pixies)	None
205	Full Body-Bind Curse	Petrificus Totalus	Curse	Temporary Paralysis	White
206	Piertotum Locomotor	Piertotum Locomotor	Charm	Animates target	None or Green
207	Piscifors	Piscifors	Transfiguration	Turns target into fish	Blue
208	Placement Charm	\N	Charm	Places object on target	\N
209	Four-Point Spell	Point Me	Spell	Wand points due north	None
210	Portus	Portus	Charm	Turns object into Portkey	Blue
211	Reverse Spell	Prior Incantato	Charm	Shows the previous spells cast by a wand	Gold
212	Protean Charm	\N	Charm	Links objects	\N
213	Shield Charm	Protego	Charm	Reflects spells and blocks physical forces	Invisible on its own, reflects light of spell
214	Protego Diabolica	Protego Diabolica	Dark Arts	Ring of protective black fire that only burns the caster's enemies whilst leaving their allies unharmed	\N
215	Protego horribilis	Protego horribilis	Charm	Summons a powerful protective barrier	\N
216	Protego Maxima	Protego Maxima	Charm	Summons a large protective barrier	White
217	Protego totalum	Protego totalum	Charm	Shields an area	None
218	Purple Firecrackers	\N	Charm	Exploding firecrackers	\N
219	Pus-squirting hex	\N	Hex	Causes yellowish goo to squirt from one's nose	None (bang)
220	Quietening Charm	Quietus	Charm	Quietens target	None
221	Head Shrink Spell	Redactum Skullus	Hex, Counter-curse	Shrinks head	Red or Purple
222	Shrinking Charm	Reducio	Charm	Shrinks target	Purple
223	Reductor Curse	Reducto	Curse	Destroys solid objects	Blue
224	Refilling Charm	\N	Charm	Refills beverage containers	None
225	Reparifors	Reparifors	Healing spell, Charm	Heals minor magically induced ailments	Purple
226	Reverte	Reverte	Charm	Returns objects to their original positions or states	\N
227	Revulsion Jinx	Relashio	Jinx	Forces target to let go	Purple
228	Reviving Spell	Rennervate	Charm	Awakens victim	Red
229	Reparifarge	Reparifarge	Untransfiguration	Reverses the effects of an incomplete Transformation spell	White
230	Mending Charm	Reparo	Charm	Fixes broken objects	None
231	Muggle-Repelling Charm	Repello Muggletum	Charm	Repels Muggles	None (haze)
232	Repello Inimicum	Repello Inimicum	Charm	Repels enemies. If used with Protego Maxima and Fianto Duri, it disintegrates anything that comes in contact with the barrier.	Blueish white
233	Revelio Charm	Revelio	Charm	Reveals secrets about a person or object	Blue
234	Tickling Charm	Rictusempra	Charm	Tickles and weakens	Silver
235	Boggart-Banishing Spell	Riddikulus	Charm	Turns a Boggart into something amusing	None
236	Rose Growth	\N	Charm, Transfiguration	Accelerates the growth of a rosebush	\N
237	Rowboat spell	\N	Charm	Causes a rowboat to propel itself.	\N
238	Salvio hexia	Salvio hexia	Charm	Hex deflection	None (haze)
239	Sardine hex	\N	Hex	Victim sneezes sardines	\N
240	Sauce-making spell	\N	Conjuration	Conjures sauce	None
241	Minerva McGonagall's fire-creating spell	\N	Spell	Creates fire	Orange
242	Scouring Charm	Scourgify	Charm	Cleans objects	None
243	Sealant Charm	\N	Charm	Seals envelopes	\N
244	Sea urchin jinx	\N	Transfiguration jinx	Makes tiny spikes erupt all over the victim	\N
245	Sectumsempra	Sectumsempra	Curse	Lacerates target	White
246	Shield penetration spell	\N	Spell	Used to break down magical shields	Bluish-white
247	Shooting spell	\N	Spell	Small explosion with a gunshot-sound	None
248	Smashing spell	\N	Curse	Explosive	Blue
249	Snake Summons Spell	Serpensortia	Conjuration	Conjures snake	White
250	Silencing Charm	Silencio	Charm	Silences target	None
251	Skurge Charm	Skurge	Charm	Cleans ectoplasm, Frightens ghosts and other spirits	Green
252	Slippery Jinx	\N	Jinx	Makes object slippery	\N
253	Slug-vomiting Charm	Slugulus Eructo	Curse	Victim vomits slugs	Green
254	Sonorous Charm	\N	Charm	Emits a magnified roar from the tip of the wand	Orange
255	Amplifying Charm	Sonorus	Charm	Loudens target	None
256	Specialis Revelio	Specialis Revelio	Charm	Reveals spells cast on objects or potions	None
257	Sponge-Knees Curse	\N	Curse	Causes the target's legs to become spongy	\N
258	Softening Charm	Spongify	Charm	Softens objects	Purple or Orange
259	Squiggle Quill	\N	Transfiguration	Transfigures writing quills into worms	\N
260	Stealth Sensoring Spell	\N	Spell	Detects those under magicaldisguise.	\N
261	Steleus	Steleus	Hex	Causes target to sneeze	Green
262	Stinging Jinx	\N	Jinx, Hex	Stings flesh	White
263	Stretching Jinx	\N	Jinx	Expands the target	\N
264	Stunning Spell	Stupefy	Charm	Knocks out target	Red
265	Supersensory Charm	\N	Charm	Superior perception	\N
266	Surgito	Surgito	Counter-charm	Removes enchantments	\N
267	Switching Spell	\N	Transfiguration	Switches two objects	White
268	Taboo	\N	Curse	When a word is spoken, the caster is alerted and protective enchantments around the speaker are weakened.	None
269	Tail-growing hex	\N	Hex	Gives the victim a tail	\N
270	Dancing Feet Spell	Tarantallegra	Jinx	Sends legs out of control	\N
271	Teacup to tortoise	\N	Transfiguration	Transforms a teacup into a tortoise	Blue
272	Teapot to tortoise	\N	Transfiguration	Transforms a teapot into a tortoise	Orange
273	Teeth-straightening spell	\N	Charm	Straightens teeth	\N
274	Teleportation spell	\N	Spell	Makes objects teleport elsewhere	\N
275	Tentaclifors	Tentaclifors	Transfiguration Jinx	Turns victim's head into tentacle	Purple
276	Tergeo	Tergeo	Charm	Cleans up objects	None
277	Tickling Hex	Titillando	Hex	Tickles and weakens	Purple
278	Toenail-growing hex	\N	Hex	Causes its victim's toenails to grow alarmingly fast	\N
279	Transmogrifian Torture	\N	Curse	Tortures, possibly by transfiguring the target to death	\N
280	Trip Jinx	\N	Jinx	Trips victim	\N
281	Twitchy-Ears Hex	\N	Hex	Makes victim's ears twitch	\N
282	Unbreakable Charm	\N	Charm	Makes object unbreakable	\N
283	Unbreakable Vow	\N	Spell	Magical vow that is fatal if broken	Red
284	Unsupported flight	\N	Spell	Allows a witch or wizard to fly unaided	\N
285	Vacuum cleaner spell	\N	Charm	Cleans an object like a vacuum cleaner	None
286	Ventus Jinx	Ventus	Jinx	Jet of spiralling wind	Grey
287	Ventus Duo	Ventus Duo	Jinx	Creates a stronger jet of wind compared to Ventus	\N
288	Vera Verto	Vera Verto	Transfiguration	Transforms animals into water goblets	Crystal clear
289	Verdillious	Verdillious	Charm	Causes the wand tip to burn like a sparkler whilst damaging the foe.	Green
290	Verdimillious Charm	Verdimillious	Charm	Emits green sparks from the wand that can: Do damage to opponents , Reveal hidden things	Green
291	Verdimillious Duo Spell	Verdimillious	Charm	Emits green sparks from the wand that can: Do damage to opponents , Reveal hidden things	Green
292	Vermiculus Jinx	Vermiculus	Jinx	Turns things into worms	Yellow
293	Red Sparks	Vermillious	Charm	Jet of red sparks	Red
294	Snake-Vanishing Spell	Vipera Evanesca	Vanishment	Vanishes snakes	Black smoke
295	Vulnera Sanentur	Vulnera Sanentur	Healing spell, Counter-curse	Slows blood flow, Clears residue, Knits wounds	None
296	Waddiwasi	Waddiwasi	Jinx	Propels wad at the target	None
297	Washing up spell	\N	Charm	Cleans dishes	None
298	Levitation Charm	Wingardium Leviosa	Charm	Makes objects fly	None
299	White sparks	\N	Charm	Jet of white sparks	White
300	Episkey	Episkey	Healing spell, Charm	Heals minor injuries	None
\.


--
-- PostgreSQL database dump complete
--

