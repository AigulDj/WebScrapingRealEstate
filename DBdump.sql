--
-- PostgreSQL database dump
--

-- Dumped from database version 14.5
-- Dumped by pg_dump version 14.5

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
-- Name: apartments; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.apartments (
    id integer NOT NULL,
    image character varying NOT NULL,
    title character varying NOT NULL,
    date character varying NOT NULL,
    location character varying NOT NULL,
    bedroom character varying NOT NULL,
    description character varying NOT NULL,
    price character varying NOT NULL,
    currency character varying NOT NULL
);


ALTER TABLE public.apartments OWNER TO postgres;

--
-- Name: apartments_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.apartments_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.apartments_id_seq OWNER TO postgres;

--
-- Name: apartments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.apartments_id_seq OWNED BY public.apartments.id;


--
-- Name: apartments id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.apartments ALTER COLUMN id SET DEFAULT nextval('public.apartments_id_seq'::regclass);


--
-- Data for Name: apartments; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.apartments (id, image, title, date, location, bedroom, description, price, currency) FROM stdin;
181	https://media.kijiji.ca/api/v1/ca-prod-dealer-ads/images/cc/cce806b9-4866-4d59-a4bd-309423526841?rule=kijijica-200-jpg	Renovated 2 Bedroom	09/09/2022	City of Toronto	Beds: 2	Lakeview Towers Located at 22 Close Avenue King & Jameson show off the stunning views of the city! minutes away from water front parks. Easy access to downtown via TTC Property Features: Security ...	2,795.00	$
182	https://media.kijiji.ca/api/v1/ca-prod-dealer-ads/images/d2/d2c71fec-71ba-40b2-890f-2b7bf5ccfbcf?rule=kijijica-200-jpg	2BR Brand new Condo units w/Parking at St Clair & Keele St	06/09/2022	City of Toronto	Beds: 2 + Den	Looking for a couple/working professional to lease brand new Condo units at St. Clair Ave & Keele available immediately !! Steps to Loblaws, Walmart, LCBO, Runnymede TTC Station, The Junction, ...\nLeasing Condos all over GTA!! Studio, 1 Bedroom, 1+Den, 2 bedroom, 3 Bedroom....CALL NOW!!	2,900.00	$
183	https://media.kijiji.ca/api/v1/ca-prod-dealer-ads/images/67/678a3cac-616b-412e-9065-aa5f3b9657eb?rule=kijijica-200-jpg	Eglitnon /Allen Road- one bedroom at subway	23/08/2022	City of Toronto	Beds: 1	We have a One bedroom apartment available in a quiet low rise apartment building across from Eglinton Avenue, West, subway, and next to a park. Rent is from $1650.00/month for the one bedroom apt. ...	1,650.00	$
184	https://media.kijiji.ca/api/v1/ca-prod-dealer-ads/images/16/167f9cc9-9c85-4c5a-aca5-b019d71763b7?rule=kijijica-200-jpg	Buy Condo with Zero Down near Lawrence / Kingston -RENT TO OWN	15/08/2022	City of Toronto	Beds: 3	For Sale - BUY THIS CONDO WITH ZERO DOWN OR 5% DOWN PAYMENT PROGRAM Welcome To Very Spacious Apartment With 3 Bedrooms And A Large Living Room. Well Maintained Condo Apartment, Newly Painted & ...	n/a	P
185	https://media.kijiji.ca/api/v1/ca-prod-dealer-ads/images/28/2833083e-401f-45f6-9aef-ef4082b3d37a?rule=kijijica-200-jpg	1 Bedroom - 263/273/283 Pharmacy Ave	09/09/2022	City of Toronto	Beds: 1	Located only 10 minutes north of Lake Ontario and Ashbridges Bay Park. Only 20 minutes east of downtown Toronto on a major city bus route at the intersection of Pharmacy Ave. and Dolphin Drive. One ...	1,705.00	$
186	https://media.kijiji.ca/api/v1/ca-prod-fsbo-ads/images/cd/cd0f45b0-3615-44f6-82ca-a500b2092ecf?rule=kijijica-200-jpg	Bachelor / Studio Basement apartment at Sheppard and Pharmacy	09/09/2022	Toronto	Beds: Bachelor/Studio	Located in a very convenient location TTC one minute walk to the corner of Sheppard and Pharmacy Grocery shopping and restaurants 5 minute walk Private shower Kitchenette Laundry included High ...	1,200.00	$
187	https://media.kijiji.ca/api/v1/ca-prod-fsbo-ads/images/52/520cd18f-2b9a-4a90-8012-50d4a6e88aac?rule=kijijica-200-jpg	3 bedroom basement apartment including utilities	09/09/2022	Toronto	Beds: 3	Walking distance to stores,banks, guildwood go train, 5 min direve to U of T Scarborough campus. Utilities included (heat, hydro , cap on water). Maximum 4 people. No smoking. Text or email only .NO ...	2,300.00	$
188	https://media.kijiji.ca/api/v1/ca-prod-fsbo-ads/images/a5/a519f57f-2246-41e0-8d3c-14f50aa938ea?rule=kijijica-200-jpg	Fully Furnished Big 1Br Condo w/Internet, W/D, TV-Cable & Locker	09/09/2022	Toronto	Beds: 1	Fully Furnished 1Br Condo with Locker is available for rent from October 31, 2022. The building is an award winning Tridel construction at 35 Viking Lane, Toronto, ON and is adjacent to the Kipling ...	2,399.00	$
189	https://media.kijiji.ca/api/v1/ca-prod-dealer-ads/images/89/89756900-8921-41ac-bc71-b55d287da01f?rule=kijijica-200-jpg	Finch and Bathurst: 3 Goldfinch Court, SPACIOUS 1BR AVAILABLE!!	09/09/2022	City of Toronto	Beds: 1	Apartment for Rent in Toronto managed by Q Residential Key Property Details Newly renovated suites and under new management Onsite Laundry & Parking! Convenient Access to Hwy 401 & to Many Amenities! ...	1,750.00	$
190	https://media.kijiji.ca/api/v1/ca-prod-fsbo-ads/images/01/01f8f9e1-af6d-48f8-88ce-43b17d04248d?rule=kijijica-200-jpg	Spacious ALL-INCLUSIVE 2 Bedroom Home Unit for Rent in Toronto	09/09/2022	Toronto	Beds: 2	Top Floor Unit in Toronto Triplex Available for Rent Near Yonge/Eglington, close to Eglington Station ALL INCLUSIVE for utilities (hydro, gas, water, laundry) Located in midtown Toronto, this ...	2,300.00	$
191	https://media.kijiji.ca/api/v1/ca-prod-dealer-ads/images/b2/b2b8ed01-0c6d-4f7f-b74b-665d4a48c949?rule=kijijica-200-jpg	1 Bedroom - Upper Beaches! Spacious Upgraded Suites! Call now!	09/09/2022	Toronto	Beds: 1	Hurry! Limited Time offer. Move-in on or before October 1st and get 1-month free rent for October on Select suites Hurry! Limited Time offer. Move-in on or before October 1st and get 1-month free ...\nFLASH SALE | Incredible Incentives, Virtual Tours &amp; Incredible Suites! Call Today!	2,099.00	$
192	https://media.kijiji.ca/api/v1/ca-prod-dealer-ads/images/ec/ecdd5390-86fe-440b-8362-3600dbe87def?rule=kijijica-200-jpg	0 Bedroom, 1 Bathroom Apartment for Rent - 470 Roncesvalles	09/09/2022	Toronto	Beds: Bachelor/Studio	Hurry! Limited Time offer. Move-in on or before October 1st and get 1-month free rent for October on Select suites Hurry! Limited Time offer. Move-in on or before October 1st and get 1-month free ...	1,619.00	$
193	https://media.kijiji.ca/api/v1/ca-prod-dealer-ads/images/33/3306e094-f66a-48c7-9f75-e26f9a71a4ef?rule=kijijica-200-jpg	NEW | Renovated 1 Bedroom Apartment | Call Today!	09/09/2022	Toronto	Beds: 1	Hurry! Limited Time offer. Move-in on or before October 1st and get 1-month free rent for October on Select suites Hurry! Limited Time offer. Move-in on or before October 1st and get 1-month free ...\nIncentives, Virtual Tours &amp; Incredible Suites! Call Today.	2,239.00	$
194	https://media.kijiji.ca/api/v1/ca-prod-dealer-ads/images/20/20436cf5-cc3a-4274-9d2f-e18f3f344651?rule=kijijica-200-jpg	PROMO! SAVE $2,400 Large 2 Bedroom+Den - Yonge/Wellesley - Call	09/09/2022	Toronto	Beds: 2	Incredible bachelor,1 and 2 bedroom apartments are available for rent now! Do not miss out on boutique living in the city! Live in the beating heart of the city, tucked away from the hustle and ...\nIncredible Incentives, Virtual Tours &amp; Incredible Suites! Call Today!	2,539.00	$
196	https://media.kijiji.ca/api/v1/ca-prod-dealer-ads/images/30/306eaec5-e5f0-4d27-a576-9fff22f15362?rule=kijijica-200-jpg	BUY A HOUSE WITH OUR *EXCLUSIVE* $0 DOWN OR RENT-TO-OWN PROGRAM	09/09/2022	City of Toronto	Beds: 4	***Buy Any house with our exclusive Zero Down/Rent-To-Own Programs or 5%/10% down payment based on your qualifications (Need to be working Permanent full-time) (Credit has to be 650+) ONLY 15 SPOTS ...	n/a	P
197	https://media.kijiji.ca/api/v1/ca-prod-dealer-ads/images/d2/d2c71fec-71ba-40b2-890f-2b7bf5ccfbcf?rule=kijijica-200-jpg	2BR Brand new Condo units w/Parking at St Clair & Keele St	06/09/2022	City of Toronto	Beds: 2 + Den	Looking for a couple/working professional to lease brand new Condo units at St. Clair Ave & Keele available immediately !! Steps to Loblaws, Walmart, LCBO, Runnymede TTC Station, The Junction, ...\nLeasing Condos all over GTA!! Studio, 1 Bedroom, 1+Den, 2 bedroom, 3 Bedroom....CALL NOW!!	2,900.00	$
198	https://media.kijiji.ca/api/v1/ca-prod-dealer-ads/images/16/167f9cc9-9c85-4c5a-aca5-b019d71763b7?rule=kijijica-200-jpg	Buy Condo with Zero Down near Lawrence / Kingston -RENT TO OWN	15/08/2022	City of Toronto	Beds: 3	For Sale - BUY THIS CONDO WITH ZERO DOWN OR 5% DOWN PAYMENT PROGRAM Welcome To Very Spacious Apartment With 3 Bedrooms And A Large Living Room. Well Maintained Condo Apartment, Newly Painted & ...	n/a	P
199	https://media.kijiji.ca/api/v1/ca-prod-dealer-ads/images/4f/4f8bdbb3-ecd2-48ac-a47d-6d3a7cc1eadc?rule=kijijica-200-jpg	2 Bedroom Suite | Newly Renovated| FMR FREE Call Today!	31/08/2022	City of Toronto	Beds: 2	Beautiful, and newly renovated Bachelor, one and two bedroom suites available now! Do not miss out on calling 50 Driftwood your home, Ruby Heights, located in the North York district of Toronto, has ...\nIncredible Incentives, Virtual Tours &amp; Incredible Suites! Call Today!	2,269.00	$
200	https://media.kijiji.ca/api/v1/ca-prod-fsbo-ads/images/2d/2dfeb0fc-f078-4bbb-a5a3-72cb39afe91a?rule=kijijica-200-jpg	2BD direct access to subway Luxury North York condo for rent	23/07/2022	City of Toronto	Beds: 2	Luxury 2 BD condo*Rent Sept.1*direct access to subway*4968 Yonge 1- Luxury 2 bedroom corner unit on the 36th floor with an unobstructed view 2- Hardwood floor 3- Huge balcony 4- Direct access to ...	2,900.00	$
201	https://media.kijiji.ca/api/v1/ca-prod-dealer-ads/images/e1/e19f34c0-a496-4d93-aa81-e50d95de5744?rule=kijijica-200-jpg	2 Bdrm available at 77 Huntley Street, Toronto	09/09/2022	Toronto	Beds: 2	Visit our Website: https://www.rpmsi.ca/property/huntley-apartments-77-huntley/ Come experience the Huntley Apartments. Featuring balconies and other upgrades, and only steps away from Sherbourne ...	2,635.00	$
202	https://media.kijiji.ca/api/v1/ca-prod-fsbo-ads/images/cd/cd0f45b0-3615-44f6-82ca-a500b2092ecf?rule=kijijica-200-jpg	Bachelor / Studio Basement apartment at Sheppard and Pharmacy	09/09/2022	Toronto	Beds: Bachelor/Studio	Located in a very convenient location TTC one minute walk to the corner of Sheppard and Pharmacy Grocery shopping and restaurants 5 minute walk Private shower Kitchenette Laundry included High ...	1,200.00	$
203	https://media.kijiji.ca/api/v1/ca-prod-fsbo-ads/images/52/520cd18f-2b9a-4a90-8012-50d4a6e88aac?rule=kijijica-200-jpg	3 bedroom basement apartment including utilities	09/09/2022	Toronto	Beds: 3	Walking distance to stores,banks, guildwood go train, 5 min direve to U of T Scarborough campus. Utilities included (heat, hydro , cap on water). Maximum 4 people. No smoking. Text or email only .NO ...	2,300.00	$
204	https://media.kijiji.ca/api/v1/ca-prod-fsbo-ads/images/a5/a519f57f-2246-41e0-8d3c-14f50aa938ea?rule=kijijica-200-jpg	Fully Furnished Big 1Br Condo w/Internet, W/D, TV-Cable & Locker	09/09/2022	Toronto	Beds: 1	Fully Furnished 1Br Condo with Locker is available for rent from October 31, 2022. The building is an award winning Tridel construction at 35 Viking Lane, Toronto, ON and is adjacent to the Kipling ...	2,399.00	$
205	https://media.kijiji.ca/api/v1/ca-prod-dealer-ads/images/89/89756900-8921-41ac-bc71-b55d287da01f?rule=kijijica-200-jpg	Finch and Bathurst: 3 Goldfinch Court, SPACIOUS 1BR AVAILABLE!!	09/09/2022	City of Toronto	Beds: 1	Apartment for Rent in Toronto managed by Q Residential Key Property Details Newly renovated suites and under new management Onsite Laundry & Parking! Convenient Access to Hwy 401 & to Many Amenities! ...	1,750.00	$
206	https://media.kijiji.ca/api/v1/ca-prod-fsbo-ads/images/01/01f8f9e1-af6d-48f8-88ce-43b17d04248d?rule=kijijica-200-jpg	Spacious ALL-INCLUSIVE 2 Bedroom Home Unit for Rent in Toronto	09/09/2022	Toronto	Beds: 2	Top Floor Unit in Toronto Triplex Available for Rent Near Yonge/Eglington, close to Eglington Station ALL INCLUSIVE for utilities (hydro, gas, water, laundry) Located in midtown Toronto, this ...	2,300.00	$
207	https://media.kijiji.ca/api/v1/ca-prod-dealer-ads/images/b2/b2b8ed01-0c6d-4f7f-b74b-665d4a48c949?rule=kijijica-200-jpg	1 Bedroom - Upper Beaches! Spacious Upgraded Suites! Call now!	09/09/2022	Toronto	Beds: 1	Hurry! Limited Time offer. Move-in on or before October 1st and get 1-month free rent for October on Select suites Hurry! Limited Time offer. Move-in on or before October 1st and get 1-month free ...\nFLASH SALE | Incredible Incentives, Virtual Tours &amp; Incredible Suites! Call Today!	2,099.00	$
208	https://media.kijiji.ca/api/v1/ca-prod-dealer-ads/images/ec/ecdd5390-86fe-440b-8362-3600dbe87def?rule=kijijica-200-jpg	0 Bedroom, 1 Bathroom Apartment for Rent - 470 Roncesvalles	09/09/2022	Toronto	Beds: Bachelor/Studio	Hurry! Limited Time offer. Move-in on or before October 1st and get 1-month free rent for October on Select suites Hurry! Limited Time offer. Move-in on or before October 1st and get 1-month free ...	1,619.00	$
209	https://media.kijiji.ca/api/v1/ca-prod-dealer-ads/images/33/3306e094-f66a-48c7-9f75-e26f9a71a4ef?rule=kijijica-200-jpg	NEW | Renovated 1 Bedroom Apartment | Call Today!	09/09/2022	Toronto	Beds: 1	Hurry! Limited Time offer. Move-in on or before October 1st and get 1-month free rent for October on Select suites Hurry! Limited Time offer. Move-in on or before October 1st and get 1-month free ...\nIncentives, Virtual Tours &amp; Incredible Suites! Call Today.	2,239.00	$
210	https://media.kijiji.ca/api/v1/ca-prod-dealer-ads/images/20/20436cf5-cc3a-4274-9d2f-e18f3f344651?rule=kijijica-200-jpg	PROMO! SAVE $2,400 Large 2 Bedroom+Den - Yonge/Wellesley - Call	09/09/2022	Toronto	Beds: 2	Incredible bachelor,1 and 2 bedroom apartments are available for rent now! Do not miss out on boutique living in the city! Live in the beating heart of the city, tucked away from the hustle and ...\nIncredible Incentives, Virtual Tours &amp; Incredible Suites! Call Today!	2,539.00	$
212	https://media.kijiji.ca/api/v1/ca-prod-fsbo-ads/images/40/40a1f372-c3bb-4506-a0a4-1f4678e2f576?rule=kijijica-200-jpg	2 bed 2 bath condo at Fort York available for October 1st	02/09/2022	City of Toronto	Beds: 2	Modern condo in beautiful Fort York in a very desirable area. Condo Features: Bright condo with South exposure (bright and sunny all day long) Modern Kitchen With Granite Counter Top, Island, ...	2,950.00	$
213	https://media.kijiji.ca/api/v1/ca-prod-dealer-ads/images/13/139396d4-e3e8-4415-ad97-ba65f8e45b19?rule=kijijica-200-jpg	Scarborough all bills included Wexford ar	01/09/2022	City of Toronto	Beds: 2	2 bedroom house in quite location pharmacy and Lawrence, Victoria park, surrounded by trees, double car park, can park upto 4 cars, includes electric, gas and wifi, freshly painted, new standing ...	2,300.00	$
214	https://media.kijiji.ca/api/v1/ca-prod-dealer-ads/images/32/322c439d-bf22-43c9-ae4c-763ac95fca50?rule=kijijica-200-jpg	Buy with ZERO or 5% Down or Rent To Own Program	30/08/2022	City of Toronto	Beds: 4	****Buy Any house with Zero Down or Rent-To-Own Program or 5% or 10% down payment based on your qualifications For Buyers -Buy House with Zero Down Payment Program* (Different program than ...	n/a	P
215	https://media.kijiji.ca/api/v1/ca-prod-dealer-ads/images/eb/eb209d77-c8d5-40af-b82d-9606f3d6d146?rule=kijijica-200-jpg	Two Bedroom Plus Den Penthouse | Minto Yorkville Penthouse for	09/09/2022	City of Toronto	Beds: 2 + Den	Utilities Included Heat Water Oversized, premium, and pet friendly suites designed with an open concept layout, floor-to-ceiling windows, private balconies, in-suite laundry and storage space, air ...\nPremium Two Bedroom Plus Den Penthouse Suite	10,989.00	$
216	https://media.kijiji.ca/api/v1/ca-prod-fsbo-ads/images/2d/2dfeb0fc-f078-4bbb-a5a3-72cb39afe91a?rule=kijijica-200-jpg	2BD direct access to subway Luxury North York condo for rent	23/07/2022	City of Toronto	Beds: 2	Luxury 2 BD condo*Rent Sept.1*direct access to subway*4968 Yonge 1- Luxury 2 bedroom corner unit on the 36th floor with an unobstructed view 2- Hardwood floor 3- Huge balcony 4- Direct access to ...	2,900.00	$
217	https://media.kijiji.ca/api/v1/ca-prod-dealer-ads/images/f6/f64cda22-a45e-47ea-8021-44973dc51142?rule=kijijica-200-jpg	2 Bedroom Apartments for Rent in Toronto	09/09/2022	Toronto	Beds: 2	***Join us for our Open House Every Wednesday From 4:00 pm - 6:00pm*** *Enjoy a $500 Gift Card Conditions May Apply. Contact us for Details.* Ideally situated just off HWY 401, this great location is ...\nAsk About our Rental Incentive!	2,332.00	$
218	https://media.kijiji.ca/api/v1/ca-prod-dealer-ads/images/bb/bb2d42e9-ce34-43b0-bdb6-cae3a36a77ab?rule=kijijica-200-jpg	1 Bedroom Apartments for Rent in Toronto	09/09/2022	Toronto	Beds: 1	***Join us for our Open House Every Wednesday From 4:00 pm - 6:00pm*** *Enjoy a $500 Gift Card Conditions May Apply. Contact us for Details.* Ideally situated just off HWY 401, this great location is ...\nAsk About our Rental Incentive!	1,874.00	$
219	https://media.kijiji.ca/api/v1/ca-prod-dealer-ads/images/0f/0fe52d75-69c7-4e48-90fa-a44b264ae63c?rule=kijijica-200-jpg	1 Bedroom Apartments for Rent in Toronto	09/09/2022	Toronto	Beds: 1	*Join Us for Our Open House Every Wednesday from 4:00-6:00 pm* Ideally situated just off HWY 401, this great location is surrounded by Clanton and Earl Bales Parks. It is the perfect rental in North ...\nAsk About our Rental Incentive!	1,842.00	$
220	https://media.kijiji.ca/api/v1/ca-prod-dealer-ads/images/9d/9d139811-1aca-41eb-a7e5-f68e18ba9155?rule=kijijica-200-jpg	North York 1 Bedroom Apartment for Rent	09/09/2022	City of Toronto	Beds: 1	Join us for our Open House Every Saturday from 11:00 - 1:00pm To view our property from the comfort of your own home, click the virtual tour link above! Virtual tours are for illustrative purposes ...\nEnjoy Condo Living Without the Fees	1,955.00	$
221	https://media.kijiji.ca/api/v1/ca-prod-dealer-ads/images/fa/fa201813-9660-466b-afc2-cb0ea8f18b1f?rule=kijijica-200-jpg	1 Bedroom Apartments for Rent on Queen Street East	09/09/2022	City of Toronto	Beds: 1	Property Features These exceptional low-rise properties sit on the north side of Queen Street East just east of Victoria Park Avenue located in the well sought-after neighborhood of The Beaches. Just ...\nAsk About our Rental Incentive!	1,822.00	$
222	https://media.kijiji.ca/api/v1/ca-prod-dealer-ads/images/68/68a8204f-18cd-426b-b263-ad7199138cdf?rule=kijijica-200-jpg	1 Bedroom Apartments for Rent in the North York	09/09/2022	City of Toronto	Beds: 1	Join us for our Open House Every Saturday from 11:00 - 1:00pm To view our property from the comfort of your own home, click the virtual tour link above! Virtual tours and exterior renderings are for ...\nEnjoy Condo Living Without the Fees	1,725.00	$
223	https://media.kijiji.ca/api/v1/ca-prod-dealer-ads/images/8f/8f45fc9e-1682-48fd-9002-9975d897e55c?rule=kijijica-200-jpg	2 Bedroom Apartments for Rent in North York	09/09/2022	City of Toronto	Beds: 2	Join us for our Open House Every Saturday from 11:00 - 1:00pm To view our property from the comfort of your own home, click the virtual tour link above! Virtual tours and exterior renderings are for ...\nEnjoy Condo Living Without the Fees	2,331.00	$
224	https://media.kijiji.ca/api/v1/ca-prod-dealer-ads/images/08/08de1e05-7f95-4788-9c8b-424d1943ec6f?rule=kijijica-200-jpg	2 Bedroom Suite!	09/09/2022	City of Toronto	Beds: 2	Spacious 2 bedroom suite available September 1st in one of the best locations in the city! $2250 indoor pool, gym and park-like setting in well established neighbourhood.1A and 1B Richview have the ...\nSpacious rental suites in gorgeous park location!	2,250.00	$
225	https://media.kijiji.ca/api/v1/ca-prod-dealer-ads/images/45/453e5730-9e3e-4310-a896-94f16e2fa64a?rule=kijijica-200-jpg	Etobicoke - 2 Bedroom suite available!	09/09/2022	City of Toronto	Beds: 2	Location Location Location! Great value for your rental dollar at Willowridge Towers. Only one unit available for immediate occupancy! 2BR newly renovated from $2200. Additional 1 & 2 bedroom suites ...\nConveniently located rental suites available now!	2,200.00	$
226	https://media.kijiji.ca/api/v1/ca-prod-dealer-ads/images/9d/9d978bce-716d-458d-bad9-6b7047c28ada?rule=kijijica-200-jpg	37 Antrim brand-new suites now leasing!	09/09/2022	City of Toronto	Beds: 2	Location Location Location! 2 & 3 Bedroom units available! The Antrims are conveniently located at 401/Kennedy Road. 37 Antrim newly built suites featuring floor to ceiling windows, stainless steel ...\nGorgeous rental suites steps from all you need!	2,485.00	$
227	https://media.kijiji.ca/api/v1/ca-prod-dealer-ads/images/b1/b1225f9c-1f2e-4fce-8649-c5809ff860a9?rule=kijijica-200-jpg	Mid-Town Yonge and St Clair Upscale 1 Bedroom (Air Condition)	09/09/2022	Toronto	Beds: 1	1 Bedroom with 650 sqft. starting at $1,949.00! Check out our website! www.commonwealthtowers.ca CALL , TEXT OR EMAIL TODAY TO BOOK A VIEWING! 416-825-8894 rentyph@outlook.com Upscale Rental Living ...	2,039.00	$
228	https://media.kijiji.ca/api/v1/ca-prod-dealer-ads/images/9f/9fb124a9-2e90-44d5-9393-3c0978c81e82?rule=kijijica-200-jpg	3 Bedroom rental North York - Available Sept 1st	09/09/2022	City of Toronto	Beds: 3	One of the most sought after neighbourhoods! Gorgeous 3BR ground level unit $2900. Completely renovated, new kitchen, new floors, new stainless steel appliances! This unit will go fast! Two bedroom ...\nGorgeous rental suites fantastic location!	2,900.00	$
229	https://media.kijiji.ca/api/v1/ca-prod-dealer-ads/images/e1/e19f34c0-a496-4d93-aa81-e50d95de5744?rule=kijijica-200-jpg	2 Bdrm available at 77 Huntley Street, Toronto	09/09/2022	Toronto	Beds: 2	Visit our Website: https://www.rpmsi.ca/property/huntley-apartments-77-huntley/ Come experience the Huntley Apartments. Featuring balconies and other upgrades, and only steps away from Sherbourne ...	2,635.00	$
230	https://media.kijiji.ca/api/v1/ca-prod-fsbo-ads/images/cd/cd0f45b0-3615-44f6-82ca-a500b2092ecf?rule=kijijica-200-jpg	Bachelor / Studio Basement apartment at Sheppard and Pharmacy	09/09/2022	Toronto	Beds: Bachelor/Studio	Located in a very convenient location TTC one minute walk to the corner of Sheppard and Pharmacy Grocery shopping and restaurants 5 minute walk Private shower Kitchenette Laundry included High ...	1,200.00	$
231	https://media.kijiji.ca/api/v1/ca-prod-fsbo-ads/images/52/520cd18f-2b9a-4a90-8012-50d4a6e88aac?rule=kijijica-200-jpg	3 bedroom basement apartment including utilities	09/09/2022	Toronto	Beds: 3	Walking distance to stores,banks, guildwood go train, 5 min direve to U of T Scarborough campus. Utilities included (heat, hydro , cap on water). Maximum 4 people. No smoking. Text or email only .NO ...	2,300.00	$
232	https://media.kijiji.ca/api/v1/ca-prod-fsbo-ads/images/a5/a519f57f-2246-41e0-8d3c-14f50aa938ea?rule=kijijica-200-jpg	Fully Furnished Big 1Br Condo w/Internet, W/D, TV-Cable & Locker	09/09/2022	Toronto	Beds: 1	Fully Furnished 1Br Condo with Locker is available for rent from October 31, 2022. The building is an award winning Tridel construction at 35 Viking Lane, Toronto, ON and is adjacent to the Kipling ...	2,399.00	$
233	https://media.kijiji.ca/api/v1/ca-prod-dealer-ads/images/89/89756900-8921-41ac-bc71-b55d287da01f?rule=kijijica-200-jpg	Finch and Bathurst: 3 Goldfinch Court, SPACIOUS 1BR AVAILABLE!!	09/09/2022	City of Toronto	Beds: 1	Apartment for Rent in Toronto managed by Q Residential Key Property Details Newly renovated suites and under new management Onsite Laundry & Parking! Convenient Access to Hwy 401 & to Many Amenities! ...	1,750.00	$
234	https://media.kijiji.ca/api/v1/ca-prod-fsbo-ads/images/01/01f8f9e1-af6d-48f8-88ce-43b17d04248d?rule=kijijica-200-jpg	Spacious ALL-INCLUSIVE 2 Bedroom Home Unit for Rent in Toronto	09/09/2022	Toronto	Beds: 2	Top Floor Unit in Toronto Triplex Available for Rent Near Yonge/Eglington, close to Eglington Station ALL INCLUSIVE for utilities (hydro, gas, water, laundry) Located in midtown Toronto, this ...	2,300.00	$
235	https://media.kijiji.ca/api/v1/ca-prod-dealer-ads/images/b2/b2b8ed01-0c6d-4f7f-b74b-665d4a48c949?rule=kijijica-200-jpg	1 Bedroom - Upper Beaches! Spacious Upgraded Suites! Call now!	09/09/2022	Toronto	Beds: 1	Hurry! Limited Time offer. Move-in on or before October 1st and get 1-month free rent for October on Select suites Hurry! Limited Time offer. Move-in on or before October 1st and get 1-month free ...\nFLASH SALE | Incredible Incentives, Virtual Tours &amp; Incredible Suites! Call Today!	2,099.00	$
236	https://media.kijiji.ca/api/v1/ca-prod-dealer-ads/images/ec/ecdd5390-86fe-440b-8362-3600dbe87def?rule=kijijica-200-jpg	0 Bedroom, 1 Bathroom Apartment for Rent - 470 Roncesvalles	09/09/2022	Toronto	Beds: Bachelor/Studio	Hurry! Limited Time offer. Move-in on or before October 1st and get 1-month free rent for October on Select suites Hurry! Limited Time offer. Move-in on or before October 1st and get 1-month free ...	1,619.00	$
237	https://media.kijiji.ca/api/v1/ca-prod-dealer-ads/images/33/3306e094-f66a-48c7-9f75-e26f9a71a4ef?rule=kijijica-200-jpg	NEW | Renovated 1 Bedroom Apartment | Call Today!	09/09/2022	Toronto	Beds: 1	Hurry! Limited Time offer. Move-in on or before October 1st and get 1-month free rent for October on Select suites Hurry! Limited Time offer. Move-in on or before October 1st and get 1-month free ...\nIncentives, Virtual Tours &amp; Incredible Suites! Call Today.	2,239.00	$
238	https://media.kijiji.ca/api/v1/ca-prod-dealer-ads/images/20/20436cf5-cc3a-4274-9d2f-e18f3f344651?rule=kijijica-200-jpg	PROMO! SAVE $2,400 Large 2 Bedroom+Den - Yonge/Wellesley - Call	09/09/2022	Toronto	Beds: 2	Incredible bachelor,1 and 2 bedroom apartments are available for rent now! Do not miss out on boutique living in the city! Live in the beating heart of the city, tucked away from the hustle and ...\nIncredible Incentives, Virtual Tours &amp; Incredible Suites! Call Today!	2,539.00	$
\.


--
-- Name: apartments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.apartments_id_seq', 239, true);


--
-- Name: apartments apartments_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.apartments
    ADD CONSTRAINT apartments_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

