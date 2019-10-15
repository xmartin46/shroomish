CREATE SCHEMA shroomish AUTHORIZATION mushroom_admin;

-- Id sequences
/*CREATE SEQUENCE trippify_trip_id_seq
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 9223372036854775807
    CACHE 1;

ALTER SEQUENCE trippify_trip_id_seq
    OWNER TO mushroom_admin;


CREATE SEQUENCE trippify_route_id_seq
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 9223372036854775807
    CACHE 1;

ALTER SEQUENCE trippify_route_id_seq
    OWNER TO mushroom_admin;


CREATE SEQUENCE trippify_participant_id_seq
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 9223372036854775807
    CACHE 1;

ALTER SEQUENCE trippify_participant_id_seq
    OWNER TO mushroom_admin;


CREATE SEQUENCE trippify_car_id_seq
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 9223372036854775807
    CACHE 1;

ALTER SEQUENCE trippify_car_id_seq
    OWNER TO mushroom_admin;*/

-- Tables
/* id integer NOT NULL DEFAULT nextval('trippify_car_id_seq'::regclass) */
CREATE TABLE user_account (
	id serial NOT NULL,
	name VARCHAR(255) NOT NULL UNIQUE COLLATE pg_catalog."default",
	email VARCHAR(255) NOT NULL UNIQUE COLLATE pg_catalog."default",
	CONSTRAINT user_account_pk PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
)
TABLESPACE pg_default;

ALTER TABLE user_account
    OWNER to mushroom_admin;



CREATE TABLE user_password (
	id serial NOT NULL,
	id_user integer NOT NULL,
	password VARCHAR(255) NOT NULL COLLATE pg_catalog."default",
	salt VARCHAR(255) NOT NULL COLLATE pg_catalog."default",
	CONSTRAINT user_password_pk PRIMARY KEY ("id"),
  CONSTRAINT user_password_fk0 FOREIGN KEY (id_user)
      REFERENCES user_account (id) /*MATCH SIMPLE
      ON UPDATE NO ACTION
      ON DELETE NO ACTION*/
) WITH (
  OIDS=FALSE
)
TABLESPACE pg_default;

ALTER TABLE user_password
    OWNER to mushroom_admin;



CREATE TABLE mushroom (
	id serial NOT NULL,
	name_eng VARCHAR(255) NOT NULL COLLATE pg_catalog."default",
	name_latin VARCHAR(255) NOT NULL UNIQUE COLLATE pg_catalog."default",
	description VARCHAR(10485760) NOT NULL COLLATE pg_catalog."default", /* 10485760 = MAX_SIZE OF VARCHAR*/
	edibility VARCHAR(255) NOT NULL COLLATE pg_catalog."default",
	CONSTRAINT mushroom_pk PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
)
TABLESPACE pg_default;

ALTER TABLE mushroom
    OWNER to mushroom_admin;



CREATE TABLE mushroom_coordinate (
	id serial NOT NULL,
	id_mushroom integer NOT NULL,
	LatLng VARCHAR(255) NOT NULL COLLATE pg_catalog."default",
	CONSTRAINT mushroom_coordinate_pk PRIMARY KEY ("id"),
  CONSTRAINT mushroom_coordinate_fk0 FOREIGN KEY (id_mushroom)
      REFERENCES mushroom (id) /*MATCH SIMPLE
      ON UPDATE NO ACTION
      ON DELETE NO ACTION*/
) WITH (
  OIDS=FALSE
)
TABLESPACE pg_default;

ALTER TABLE mushroom_coordinate
    OWNER to mushroom_admin;



CREATE TABLE mushroom_image (
	id serial NOT NULL,
	id_mushroom integer NOT NULL,
	URL VARCHAR(255) NOT NULL COLLATE pg_catalog."default",
	CONSTRAINT mushroom_image_pk PRIMARY KEY ("id"),
  CONSTRAINT mushroom_image_fk0 FOREIGN KEY (id_mushroom)
      REFERENCES mushroom (id) /*MATCH SIMPLE
      ON UPDATE NO ACTION
      ON DELETE NO ACTION*/
) WITH (
  OIDS=FALSE
)
TABLESPACE pg_default;

ALTER TABLE mushroom_image
    OWNER to mushroom_admin;

-- Insert values
/* ************************ mushroom ************************* */
INSERT INTO mushroom(name_eng, name_latin, description, edibility) VALUES ('Horse Mushroom','Agaricus arvensis','Cap 8-20 cm diameter, stem 8-10 cm tall * 2-3 cm diameter. Agaricus arvensis, commonly known as the horse mushroom, is a sometimes massive agaric that has a white cap, ringed stem, and pink or chocolate colored gills.

Cap white or cream colored, may have fine scales, first hemispherical in shape before flattening out with maturity. Flesh is white, firm and thick. Gills are at first white, becoming pink, then chocolate brown or blackish, free and crowded. Stem is white or cream; it is slightly club-shaped and smooth or finely scaly below the ring. Ring is white or cream, pendulous and superior. Viewed from below, on a closed-cap specimen, it has a well-developed ''cogwheel'' pattern around the stem.

Similar species There are several similar species. Agaricus macrosporus are very fleshy, with scaly stem girdles. Agaricus sylvicola is a woodland variety. Agaricus augustus and Agaricus xanthoderma are also similar. Be careful not to confuse it with the deadly poisonous Amanita virosa, which has white gills.
','edible and good ');
INSERT INTO mushroom(name_eng, name_latin, description, edibility) VALUES ('Panther Amanita','Amanita pantherina','Cap 5-10 cm diameter, stem 8-12 cm tall * 1-1.5 cm diameter. Amanita pantherina, also known as the panther cap or panther amanita, is a medium to large fleshy agaric with brownish cap, pure white patches, white stem, ring, bulbous base with distinct margin.

Cap shiny brown or grey-brown with a very finely striate margin, initially domed, later flatten, with densely distributed warts that are pure white to sordid cream, minutely verruculose and easily removable. Gills free, close to crowded, white becoming greyish, truncate. Stem subcyclindric, somewhat narrowing upward, white, becoming slightly tannish in age, stuffed then hollow, finely floccose becoming smooth above the white ring that is initially quite chunky but often becomes thin and floppy in more mature specimens, sometimes with a toothed edge.

Amanita pantherina on the First Nature Web site.','poisonous');
INSERT INTO mushroom(name_eng, name_latin, description, edibility) VALUES ('Fly Amanita','Amanita muscaria','Cap 8-10 cm diameter; stem 8-18 cm tall * 1-2 cm diameter. Amanita muscaria, commonly known as the fly agaric or fly amanita, is a medium to large, fleshy agaric, with red cap, white patches, white gills, ring and a bulbous base. It grows on poor and sandy soils and the fruiting bodies emerge from the soil looking like white eggs.

Cap first round to hemispherical, and finally to plate-like and flat in mature specimens, often with a low, shallow depression on disk when fully expanded. Surface shiny; deep scarlet, fading to orange-red or orange-yellow in older specimens. Gills white, free or barely touching the stem, crowded. Stem white, robust and has the slightly brittle, fibrous texture. At the base is a bulb that bears universal veil remnants in the form of two to four distinct rings or ruffs. Between the basal universal veil remnants and gills are remnants of the partial veil (which covers the gills during development) in the form of a white ring. It can be quite wide and flaccid with age.

Amanita muscaria on the First Nature Web site.
','poisonous');
INSERT INTO mushroom(name_eng, name_latin, description, edibility) VALUES ('Tawny grisette','Amanita fulva','Cap 4-9 cm diameter, stem 7-12 cm tall * 0.8-1.2 cm diameter. Amanita fulva, also known as Tawny grisette, is a medium-sized agaric with distinctive tawny cap and white gills, no ring and usually without cap patches but with volval bag. It grows solitary or scattered on soil in mixed woodlands, favouring birch. Not recommended to be eaten because of danger to be mistaken with poisonous members of the Amanita genus.

Cap tan or orange-brown with sulcate margin, occasionally with brownish velar patches, at first ovoid, becoming expanded-convex and flattened with a slight umbo. Flesh white and brittle.
Stem whitish or pallid cap coulor, narrower towards the apex and arising from white volval bag. Ring absent. Hollow in marture specimens.

Similar species Amanita crocea and Amanita vaginata.

Amanita fulva on the First Nature Web site.
','inedible');
INSERT INTO mushroom(name_eng, name_latin, description, edibility) VALUES ('Snakeskin Grisette','Amanita ceciliae','Cap 7-12 cm diameter, stem 8-13 cm tall * 1.5-2 cm diameter. The cap of this  large, grayish brown, fleshy agaric has charcoal-grey patches, which are easily removable and a scaly stem, white gills, and no ring or volval bag. It fruits during summer and autumn.

Cap is pallid gray-brown; shape ranging from convex to flat. It is upturned, and has a deep-coloured margin. There is a low umbo. Large, coarse, dingy gray patches decorate the volva. Flesh is white and firm. Gills are free and closely spaced, and white in colour. They can be thick, and are often forked. Stem is pallid, grayish brown with white shaggy horizontal bands of veil; an inconspicuous bulb is encased in a volval bag breaking away leaving slanting ridges. The mushroom has no ring.

Amanita ceciliae on the First Nature Web site.','inedible');
INSERT INTO mushroom(name_eng, name_latin, description, edibility) VALUES ('Sheep Polypore','Albatrellus ovinus','Cap 7-18 cm diameter, stem 3-7 cm tall * 1-3 cm thick. Albatrellus ovinus, also known as Sheep Polypore, is a creamy to pale gray-brown polypore that looks like an agaric or a hedgehog mushrooom from above, but it has minute pores on the underside. It stains lemon or greenish yellow, particularly on the pores. The skin of the convex cap often cracks with age. It has a sturdy stem and very firm, mild to slightly bitter white flesh. Grows under conifers, mycorrhizal with spruce on moss-covered soil.

Similar species Albatrellus confluens is more orange and does not stain yellow; it tastes bitter.

Albatrellus ovinus on the First Nature Web site.','edible ');
INSERT INTO mushroom(name_eng, name_latin, description, edibility) VALUES ('IDKWTFISTHISSHITNIGGA                                      6','Albatrellus confluens','Cap 7-18 cm diameter, stem 3-7 cm tall * 1-3 cm thick. From above, this pale orange polypore looks like an agaric or a hedgehog mushrooom, but it has minute pores on the underside. The skin of the convex cap often cracks with age. It has a sturdy stem and very firm, mild to slightly bitter white flesh. Grows under conifers, mycorrhizal with conifers in a wide variety of ecosystems.

Similar species Albatrellus ovinus is more cream white and does stain yellow or greenish yellow, particularly on the pores.','inedible');
INSERT INTO mushroom(name_eng, name_latin, description, edibility) VALUES ('The Prince','Agaricus augustus','Cap 10-20 cm diameter, stem 10-20 cm tall * 2-4 cm diameter. Agaricus augustus, also known as the prince, is a tall, sometimes massive agaric that has orange-brown scales on the surface of both cap and stem. Surfaces of all parts stain yellow when handled or bruised.

Cap hemispherical during the so-called button stage, and then expands, becoming convex and finally flat. The cap cuticle is dry, and densely covered with concentrically arranged, brown-coloured scales on a white to yellow background. The flesh is thick, firm and white and may discolour yellow when bruised. Gills are not attached to stem, crowded and pallid at first, and turn pink then dark brown with maturity. Stem Solid; cylindrical to club-shaped. The surface is white. Ring membranous, with patches of brownish fibrils under.

Similar species Agaricus subrefescens found in central and eastern U.S.

Agaricus augustus on the First Nature Web site.
','edible and good ');
INSERT INTO mushroom(name_eng, name_latin, description, edibility) VALUES ('Blushing Flagrant Tooth','Bankera fuligineoalba','Cap 5-10 cm diameter; stem 2-5 cm tall * 0.5-2 cm thick. This is a medium to large, fleshy to fibrous cap with spiny under surface. It is dark yellowish brown at center to yellowish pink or pinkish brown on margin. It becomes mush darker and quickly water-soaked in wet weather.

Cap convex at first, becoming flat or depressed at center. Margin thin, in-curved when young, lobed and wavy later. At first pallid, then brown with yellow or red tinges, remaining more pallid at the margin. Pine needles adhere to densely mattered surface fibrils.  The flesh is soft and brittle. Stem white at the apex, becoming dull brownish below, equal or tapered towards the base, downy, sometimes eccentric.','inedible');
INSERT INTO mushroom(name_eng, name_latin, description, edibility) VALUES ('Pinecone Tooth','Auriscalpium vulgare','Cap 1-2 cm diameter; stem 2-6 cm tall * 0.1-0.2 cm diameter. This mushroom is small to long medium sized, with a brown cap attached at one side or off center of the stem. The long, slender, stem rises from decaying pine cones.

Cap flat to rounded. Upper side brown to dark purplish brown, covered with dark brown fibrils. Under side spiny. Flesh thin, flexible. Spines light to dark brown.
Stem brown, hairy, rigid, joined laterally to the cap, swollen towards the base.

Auriscalpium vulgare on the First Nature Web site.','inedible');
INSERT INTO mushroom(name_eng, name_latin, description, edibility) VALUES ('Honey Mushroom','Armillaria mellea','Cap 3-15 cm diameter, stem 6-15 cm tall * 0.5-1.5 cm thick. This large agaric has a convex, flattened, or wavy, olive-tinged, pale yellow-brown cap with a darker center and sparse pale scales. It grows in dense clusters on and around the stumps of leaf and coniferous trees.

Cap convex at first but becoming flattened, often with a central raised umbo, later becoming somewhat dish-shaped. The margins are often arched at maturity and the surface is sticky when wet. Though typically ochraceous, this fungus is rather variable in appearance and sometimes has a few dark, hairy scales near the centre somewhat radially arranged. The flesh white, thin and firm. Gills at first white, sometimes becoming pinkish-yellow or discoloured with age, broad and fairly distant, attached to the stipe at right angles or are slightly decurrent, crowded. The spore print is white. Stem at first whitish, becoming yellowish or reddish brown, more or less equal or tapering towards the base, finely wholly. The ring is yellowish, cottony or woolly, superior and fairly persistent.

Similar species The mushroom can be mistaken with Galerina marginata, which is deadly poisonous.

Armillaria mellea on the First Nature Web site.
','edible ');
INSERT INTO mushroom(name_eng, name_latin, description, edibility) VALUES ('Destroying angel','Amanita virosa','Cap 5-9 cm diameter, stem 13-20 cm tall * 1.5-2 cm diameter. Amanita virosa, also known as Destroying angel, is a lethally poisonous, medium large to large, white fleshy mushroom with a shaggy stalk and volval bag. It grows solitary or scattered on soil in broad-leaf or mixed woods.

Cap white to yellow in color, at first round to egg shaped, then flat but often retaining a flat umbo, usually with veil remnants at the margins. The flesh white and firm. Gills white (can turn yellow), free, crowded. Stem long and thread-like and has tufts above the ring and arising from large bag-like vulva often buried deep in the soil. The large ring sits high on the stem. Easily breaks and falls off and is produced by the inner veil.

Similar species Amanita bisporigera is a smaller, more slender, two-spored, but equally deadly mushroom. The mushroom can also be confused with edible Button mushrooms (Agaricus species). They have faint pink to brown gills, where Amanita virosa has white gills.
','lethally poisonous');
INSERT INTO mushroom(name_eng, name_latin, description, edibility) VALUES ('Blushing Amanita','Amanita rubescens','Cap 6-15 cm diameter, stem 6-15 cm tall * 1-2.5 cm thick. This is a large, rosy-brown, fleshy agaric that has cap patches, white gills, a bulbous base and ring on stem. A significant characteristics is that it blush when bruised or cut, and is since also called the blusher. It grows solitary or scattered on soil in woods generally.

Cap pinkish brown with gray to pink patches on surface. At first it is sub-spherical, becoming convex and finally flattened. Flesh is moderately firm and white, becoming brownish pink where cut or damaged. Gills crowded, soft, white to off-white, free from stem, with pink tinges appearing on damaged areas. Spores are white. Stem downy, gray, white, or pink, bears a prominent pendent ring with furrows on it''s upper surface. The base is swollen and girdled.

Amanita rubescens on the First Nature Web site.','poisonous');
INSERT INTO mushroom(name_eng, name_latin, description, edibility) VALUES ('Royal Fly Agaric','Amanita regalis','Cap 5-10 cm diameter, stem 6-12 cm tall * 1.5-2.5 cm thick. This is a medium to large, brown, fleshy agaric with cap patches, white gills, ring, basal bulb. Grows solitary or scattered on soil in mixed woods.

Cap brown; at first convex, becoming expanded-convex or flattened, smooth and slightly greasy in damp conditions, decorated with delicate, non-persistent, whitish or whitish grey velar patches. Flesh white firm and medium.
Gills are crowded close together, free from attachment to the stem, and white with a creamy yellow tinge. Stem white, smooth, lined above the ring. Ring large white and fairly firm, superior.
','poisonous');
INSERT INTO mushroom(name_eng, name_latin, description, edibility) VALUES ('Grey veiled amanita','Amanita porphyria','Cap 4-10 cm diameter; stem 5-12 cm tall * 1-1.5 cm diameter. This medium to large, fleshy agaric that has greyish brown cap, sometimes with grey patches, white gills, ring, bulbous base, grows near coniferous trees.

Cap hemispherical when young, later flat, greyish brown to brown in colour, usually smooth, sometimes with grey patches. Gills soft, crowded, white and free from the stem. Flesh is white with a smell of radish. Stem thick, smooth, white or pale yellow and has a grey to black ring. Has also a basal bulb.

Similar species Amanita porphyria can easily be confused with much more poisonous species such as the Panther cap (Amanita pantherina).

Amanita porphyria on the First Nature Web site.','poisonous');
INSERT INTO mushroom(name_eng, name_latin, description, edibility) VALUES ('Death Cap Amanita','Amanita phalloides','Cap 6-12 cm diameter, stem 7-12 cm tall * 1 - 1.5 cm thick. This is a lethally poisonous, medium to large, fleshy agaric with greenish olive cap, whitish stem, ring, no patches but distinctive volval sheath. As the volva, which may be hidden by leaf litter, is a distinctive and diagnostic feature, it is important to remove some debris to check for it.

Cap at first round to egg-shaped and then flat. Varies greatly in colour from gray-white to green and yellow brown and has dark radial lines from the center. Sometimes with lots of veil remnants. Gills free, close, white, can turn yellow. Stem white with a scattering of grayish-olive scales and with a swollen, ragged, sac-like white volva (base). Ring white or colored like the stem, broad, thin, persistent.

Similar species Some Volvariella species look similar to older speciemens of Amanita phalloides. They are distinguished by a pale pink spore deposit and lack of a stem ring.

Amanita phalloides on the First Nature Web site.','lethally poisonous');
INSERT INTO mushroom(name_eng, name_latin, description, edibility) VALUES ('Bitter Bolete','Tylopilus felleus','Cap 6-12 cm diamter, stem 7-10 cm tall * 2-3 cm diameter. Slightly to distinctly pink pores on the underside of the bun-shaped brown cap and a dark net on the thick stem are characteristic of this bolete. It is also distinguished by a very bitter taste.

Cap snuff- or fulvous-brown; convex or bun-shaped, at first slightly downy then smooth and dry. Flesh whitish, with pinkish tinge beneath cap cuticle, unchanging, thick and firm. Stem pallid background with brown reticulation, stout and slightly bulbous. The mushroom has no ring.

Similar species When young this is easily mistaken for Boletus edulis, except that it is very bitter and has a dark stem net.','inedible');
INSERT INTO mushroom(name_eng, name_latin, description, edibility) VALUES ('Scaly Chanterelle','Turbinellus floccosus','5-15 cm diameter * 8-15 cm tall. This mushroom has an orange-capped vase- or trumpet-shaped fruiting body. The lower surface, the hymenium, is covered in wrinkles and ridges rather than gills or pores, and is pale buff or yellowish to whitish.

Fruiting body initially cylindrical, maturing to trumpet- or vase-shaped. There is no clear demarcation between the cap and stipe. The stripe it is solid in younger specimens, though is often hollowed out by insect larvae in older. At higher elevations, two or three fruit bodies may arise from one stipe. Colored various shades of reddish- to yellowish-orange, the cap surface is broken into scales, with the spaces between more yellow and the scales themselves more orange. The white flesh is fibrous and thick, though thins with age. Somewhat brittle, it can sometimes turn brown when cut or bruised. Spores are brownish.

Similar species The related Turbinellus kauffmanii is similar-looking but has a pale brown cap. Younger specimens of the latter species also have a pungent smell. Turbinellus fujisanensis, found in Japan, is another lookalike that has smaller spores than Turbinellus floccosus.
','inedible');
INSERT INTO mushroom(name_eng, name_latin, description, edibility) VALUES ('Plums and Custard','Tricholomopsis rutilans','Cap 2-12 cm diameter; stem 3.5-5.5 cm tall * 1-1.5 cm diameter. This medium to large, fleshy agaric has a cap with plum fibrils on custard yellow backround and gills are egg -yellow, which makes it easily recognised. It grows solitary or in small caespitose tufts on or close to rotting conifer stumps.

Cap plum-red scaled cap with yellow base colour. At first convex, becoming broadly umbonate. Gills egg -yellow, adnexed, broad, crowded. Stem yellow and covered with reddish purple, fibrillose scales, less densely than on cap, more or less equal. Flesh pallid yellow, tough, stuffed or full.
Stem cylindrical and with a red scaly base developing to a yellow colour towards the cap. It has no ring or volva.','inedible');
INSERT INTO mushroom(name_eng, name_latin, description, edibility) VALUES ('Yellow Rider','Tricholomopsis decora','Cap 4-12 cm diameter, stem 3.5-5.5 cm tall * 1-1.5 cm thick. This is a medium to large, fleshy agaric, cap with brown fibrils on a predominantly yellow background with brown to blackish scales, thinning towards the margin.

Cap egg-yellow, densely covered with brownish, firbrillose scales thinning towards the margin; at first convex, becoming broadly umbonate. Flesh pallid yellow and thin. Gills egg-yellow, adnexed very broad, crowded. Spores Spore print white. Stem yellow and covered with brownish, fibrillose scales, less densely than on cap, more or less equal. The mushroom has no ring.','inedible');
INSERT INTO mushroom(name_eng, name_latin, description, edibility) VALUES ('False Edible Trich','Tricholoma sejunctum','Cap 4-10 cm diameter. The green or brown cap of this agaric is moist and domed and flattening with age. It''s surface has dark fibrils and is greasy in wet weather. It causes nausea if eaten.

Cap pallid, yellowish with fine, brownish or tan, radiating fibrils; at first convex, becoming flattened, with broad umbo, slightly sticky. Flesh off-white, tinted yellow under the cap skin. Gills whitish ochre, emarginate, very broad, crowded. Stem coloured as cap, but more pallid, smooth, more or less equal or tapering upwards. It develops yellow flushes with age. The mushroom has no ring.

Similar species Tricholoma portentosum has darker hat, and Tricholoma arvernense grows in coniferous forest. The poisonous Amanita phalloides is distinguished by it''s volva, stem ring, and free gills.','inedible');
INSERT INTO mushroom(name_eng, name_latin, description, edibility) VALUES ('Soapy Trich','Tricholoma saponaceum','Cap 5-10 cm diameter; stem 5-10 cm tall * 1-3 cm diameter. This is a medium to large agaric, whose hat is rounded to flattened, often humped. Cap usually tinged with olive; may be brownish on disc center. Gills close. Stalk thick; stains reddish when bruised.

Cap convex, becoming broadly convex or flat, often with a low, broad, rounded hump. Outline typically has irregular lobes or folds and splits. Cap occasionally is off center of stem. Color varies between grayish green, yellowish green, gray, blackish, copper colored, or brownish. Gills white, becoming reddish spotted, emarginate, fairly distant. Stem mor or less equal or slightly thicker below, sometimes tapered at base; often bent. Surface smooth to fibrillose or minutely scaly; white of weakly flushed with cap colors, brownish pink at base.','inedible');
INSERT INTO mushroom(name_eng, name_latin, description, edibility) VALUES ('IDKWTFISTHISSHITNIGGA                                      22','Tricholoma focale','Cap 5-10 cm diameter, stem 6-8 cm tall * 1-1.5 cm thick. This medium-sized, fleshy agaric is orange-brown to reddish-brown with cream gills and a distinctively banded stem. It grows scattered or in small trooping groups on soil with pines in coastal locations.

Cap Orange-brown to reddish-brown, cracking as it ages; convex, developing a flat top, margin inrolled. Gills white, browning on gill edges with age; adnexed to free; moderately distant. Stem white and smooth above shaggy ring, patterned with bands of large brown scales below; tapering continuously towards the base.','inedible');
INSERT INTO mushroom(name_eng, name_latin, description, edibility) VALUES ('Edible Yellow Trich','Tricholoma flavovirens','Cap 5-14 cm diameter, stem 5-10 cm tall * 1.5-2.5 cm diameter. This is an agaric with medium to large cap; vivid yellow, brown at center; no black streaks or fibrils. Gills yellow.
Cap broadly convex or nearly flat, with an inrolled margin at first; expanding to broadly convex or flat, often with a broad, low, central hump. Pale yellow at first, then greenish yellow to vivid yellow and usually remaining yellow on margin but gradually becoming brown from disk center outward. Flesh thick, firm; white or tinged with yellow under cuticle. Gills notched around apex of stem, close, broad; edges become ragged with age. Gills attached to the stem, often by means of a notch; close, bright yellow, not staining when bruised. Stem more or less equal, or enlarged at base; solid or hollowed in age. Surface smooth to fibrillose; pale to light yellow.

Similar species Be sure to distinguish from Tricholoma sulphureum and from Tricholoma sejunctum, both of which are poisonous.','edible ');
INSERT INTO mushroom(name_eng, name_latin, description, edibility) VALUES ('Variegated Bolete','Suillus variegatus','Cap 6-13 cm diameter, stem 5-9 cm tall * 1.5-2 cm thick. Tall-stemmed and fleshy, the Suillus variegatus rarely exhibits the slimminess that is characteristic of the genus suillus.

Cap sandy to rusty brown coloured. At first ovate and then convex. The skin can be removed. It has a freckly, downy surface in dry weather. Flesh pallid ochraceous and turns blue when cut and thumbed. Pores at first ochraceous with olivaceous tinge, becoming more cinnamon-brown with age, sometimes bluish where bruised. Tubes are dark ochraceous or buff, adnate. Stem smooth and firm. Mottled yellow to a brown yellow and thicker at the base. The mushroom has no ring.

Similar species Suillus tomentosus is the equivalent species in western North America.
','edible ');
INSERT INTO mushroom(name_eng, name_latin, description, edibility) VALUES ('Slippery Jack Bolete','Suillus luteus','Cap 5-10 cm diameter, stem 5-10 cm tall * 2-3 cm thick. This is a medium to large bolete with slimy, brown cap. It''s short to stubby stalk has brown dots and a well-developed ring.
Cap chestnut, rusty, olive brown, or dark brown in color. It has a distinctive conical shape, later flattening out. It is slimy to the touch, bare, smooth, and glossy even when dry, and the cuticle is easily peeled off.  Flesh whitish with yellow tinge, unchanging, moderate and soft, unchanging when cut. Pores tiny, circular, initially yellow but turn olive to dark yellow with maturity. Like the skin of the cap, they can be readily peeled away from the flesh. Tubes concolorous with pores, adnate. Spores Ocher-brown. Stem Cylindrical or tapered downwards and solid. Yellow and dotted above ring but whitish below, especially at base. Ring at first whitish, darkening with age, vinaceous-brown below and large.

Suillus luteus on the Nature First Web site.
','edible and good ');
INSERT INTO mushroom(name_eng, name_latin, description, edibility) VALUES ('Larch Bolete','Suillus grevillei','Cap 3-10 cm diameter, stem 5-7 cm tall * 1.5-2 cm diameter. This vividly colored bolete grows with larch trees in woods. The mushroom is slimy, with yellow cap, small pores and whitish ring on stem.

Cap colored from citrus yellow to burnt orange, at first hemispherical, then bell-shaped, and finally flattened. It has a sticky skin, short tubes of yellow or brownish which descend down to the bottom of its cylindrical stalk. It is sticky or viscid when damp. Flesh is pallid lemon-yellow, unchanging, moderate, soft. Pores at first pallid lemon-yellow, becoming more ochraceous and tinged rust where bruised, angular, small. Tubes pallid yellow and slightly decurrent. Spores Yellowish brown. Stem cream-colored turning to reddish brown with a cream-white ring which is superior and pointing upwards.','edible ');
INSERT INTO mushroom(name_eng, name_latin, description, edibility) VALUES ('Euro Cow Bolete','Suillus bovinus','Cap 3-10 cm diameter, stem 4-6 cm tall * 0.5-1 cm thick. This usually small, orange-rusty brown bolete, with it''s convex to flat cap and short, ringless stem, is notable for it''s compound pores: the olive-green pore layer has an outer layer of coarse; angular pores and an inner layer of fine pores.

Cap ochraceous or pinkish clay, more pallid at margin; convex or bun-shaped, smooth, sticky or viscid when damp. Flesh white with pinkish clay tinge, thick and soft. Pores at first pallid olive or buff, becoming more ochraceous with age, angular, compound, unequal, large. Tubes grayish with vinaceous tinge, more or less decurrent. Spores brownish olive. Stem pallid yellowish sienna, more or less equal or tapering at base. Ring absent.','edible ');
INSERT INTO mushroom(name_eng, name_latin, description, edibility) VALUES ('IDKWTFISTHISSHITNIGGA                                      28','Stropharia hornemannii','Cap 6-15 cm diameter, stem 6-12 cm tall * 1-2 cm thick. This is a medium-sized to large agaric with a large slimy purple or olive cap whose gills become purple with age. The stalk is long and richly decorated with pieces of the white sheath that extends up to a prominent ring.','poisonous');
INSERT INTO mushroom(name_eng, name_latin, description, edibility) VALUES ('IDKWTFISTHISSHITNIGGA                                      29','Strobilurus stephanocystis','Cap 1-2 cm diameter, stem 2-7 cm tall * 0.1-0.2 cm thick. This small, delicate agaric with tawny-brown cap and whitish gills grows solitary or in small groups, attached to buried or partly buried pine cones.

Cap brown or tawny; at first convex, becoming flattened, smooth. Flesh white and thin. Gills whitish cream, adnexed and crowded. Stem pallid and coloured as cap, finely silky-pruinose, tapering slightly upwards, typically deeply rooting. The mushroom has no ring. Flesh white, fragile and hollow.','inedible');
INSERT INTO mushroom(name_eng, name_latin, description, edibility) VALUES ('Distant-gill Cone Collybia','Strobilurus esculentus','Cap 1-2 cm diameter, stem 2-7 cm tall * 0.1-0.2 cm thick. This small, delicate agaric with brown, conical cap and whitish gills grows solitary or in small groups, attached to buried or partly buried spruce cones. Note: this species never occurs on pine cones.

Cap brownish grey, convex, becoming flattened, smooth. Flesh white and thin. It can also be off-white or brownish-black. Gills crowded, white, and somewhat sinuate. The spores are white.  Stem brownish grey with a pale apex.','inedible');
INSERT INTO mushroom(name_eng, name_latin, description, edibility) VALUES ('Scaly Tooth','Sarcodon squamosus','Cap 10-25 cm diameter, stem 4-7 cm tall * 2-4 cm thick. This large mushroom has a coarsely scaly, pale brown cap with dark grayish, spiny under-surface. It grows with pines solitary or in scattered groups, on soil in coniferous woods.

Fruiting body pale brown, decorated with coarse darker gray scales, erect at the centre, more flattened towards the incurved margin, arranged in concentric rows. It is at first shallowly convex, then flattened or slightly depressed at the centre; at first whitish, becoming gray, remaining pallid at the base, equal or somewhat clavate towards the base, downy. Flesh white, thick in the cap centre, firm, full in stem. Spines 4 to 10mm long, decurrent, white or pale buff, turning purple-brown with age.','edible ');
INSERT INTO mushroom(name_eng, name_latin, description, edibility) VALUES ('Crab Russula','Russula xerampelina','Cap 5-14 cm diameter; stem 3-11 cm tall * 1-3 cm diameter. This is a medium to large agaric, hard-fleshed cap; color varies, often dark red or purple. Mature plats have a fishy odor. All parts slowly stain dingy yellow-brown when cut or bruised.
Cap convex, becoming later flat, with a broad, shallow depression. Surface sticky when moist, but soon dry; smooth - not streaked or warty. Color most often dark red, but may be dark purple, pink, green or brown, often with traces of yellow. Gills broad, close to subdistant, adnate, yellowish white. Stem solid at first, later spongy. Surface white or flushed with pink; dry, smooth to wrinkled.','edible ');
INSERT INTO mushroom(name_eng, name_latin, description, edibility) VALUES ('Tall Bog Russula','Russula paludosa','Cap 5-14 cm diameter, stem 5-14 cm tall * 1-3 cm thick. Taller than most, this large, attractive Russula species has a convex to depressed, orange-red cap, with yellow discoloration in the center and a slightly sticky surface when damp.

Cap variable, reddish with apricot, bay, blood or scarlet tinges; at first convex, later flattened and depressed, shiny or somewhat sticky when damp, cuticle peeling halfway to center.  Flesh white, moderate, granular and brittle. Gills are cream or pallid ochraceous, adnexed, brittle, narrow, strongly interveined. Spores pale ocher. Stem white or tinged pink, more or less equal or tapering slightly upwards, smooth. Ring absent. Flesh white, fragile and stuffed.

Similar species The poisonous and hot-tasting Russula emetica has no yellow coloring on the cap.','edible ');
INSERT INTO mushroom(name_eng, name_latin, description, edibility) VALUES ('IDKWTFISTHISSHITNIGGA                                      34','Russula obscura','Cap 5-14 cm diameter, stem 6-12 cm tall * 1-3 cm thick. Russula obscura, also known as Russula vinosa, is a medium sized agaric mostly found with pine.
 ','edible ');
INSERT INTO mushroom(name_eng, name_latin, description, edibility) VALUES ('The Sickener','Russula emetica','Cap 3-10 cm diameter, stem 4-9 cm tall * 0.7-2 cm thick. Russula emetica, also know as The Sickener, is a medium-sized agaric that has a convex to slightly depressed, sharlet-red cap. It grows mainly with coniferous trees in boggy areas. It is not highly poisonous and has a very hot taste.

Cap convex to slightly depressed, and often shiny scarlet or cherry red, becoming sticky at wet. Gills are whitish, becoming pallid straw, more or less free, brittle, and narrow. Spores are white. Stem white, club shaped with a scurfy skin.

Similar species Russula silvicola is the common dry woodland species across North America. Russula fageticola usually grows under beech trees, and it also tastes hot. Amanita muscaria has veil patches on the cap, a stem ring, and a bulb.
','poisonous');
INSERT INTO mushroom(name_eng, name_latin, description, edibility) VALUES ('Copper Brittlegill','Russula decolorans','Cap 4.5-11 cm diameter, stem 4.5-10 cm tall * 1-2.5 cm thick. Russula decolorans, also know as Copper Brittlegill, is a medium to large agaric that has a distinctively colored orange-brown cap, pale yellow gills and white stem. All parts of the mushroom is graying or blackening.

Cap as young almost completely round, then convex to flat, often with a depressed center. At fist bright orange-yellow, then more subdued brick-red, sometimes with a darker center. Sticky in damp weather, and has smooth skin that can be removed. Gills at first white, then creamy yellow and finally gray. Reaching but not attached to the stem. Stem is white, graying readily when bruised or with age, more or less equal or somewhat club-shaped, stout, and smooth. The mushroom has no ring.

Similar species other Russula species.','edible ');
INSERT INTO mushroom(name_eng, name_latin, description, edibility) VALUES ('Yellow Swamp Brittlegill','Russula claroflava','Cap 4-10 cm diameter, stem 4-10 cm tall * 1-2 cm thick. Russula claroflava, also known as Yellow Swamp Brittlegill, is a brightly coloured agaric that has a convex to flat, vivid yellow cap. It grows with birch in very damp of boggy woodland.

Cap  bright yellow in colour, which diminishes with age, and slightly sticky when damp. It has a thin, smooth skin that can easily be peeled off and often a depressed center. Gills at first white, then creamy yellow. Older ones can have gray or black edges,  more or less free or reaching but not connected to the stem and fairly crowded. Stem is white, turns gray with age, more or less equal, fairly stout, and smooth. The mushroom has no ring.

Similar species Russula claroflava has a stem that grays strongly on bruising. Russula ochroleuca has a green tinge on the cap. Russlula ochroleucoides is a bitter-tasting American equivalent, growing in East Coast oak woods.','edible ');
INSERT INTO mushroom(name_eng, name_latin, description, edibility) VALUES ('Green Brittlegill','Russula aeruginea','Cap 4-9 cm diameter, stem 4-8 cm tall * 0.7-2 cm thick. Russula aeruginea, also known as Green Brittlegill, has a convex to depressed green cap that is often marked with rust- to red-brown spots and frequently has furrows at the margin. It grows solitary or in scattered groups on soil under birch.

Cap flat when young, soon funnel shaped and weakly striped; somewhat sticky and shiny, pale green to light grey-green, more rarely olive green. Flesh white, moderately thick, granular and brittle. Gills buff, becoming yellowish tinged, adnexed, forked, fairly narrow and crowded. Stem white, sometimes with rust spotting, more or less equal, smooth. Flesh white, fairly firm but brittle and full. Spores are cream-yellow colored. The mushroom has no ring.

Similar species Russula heterophylla has former flesh. The cap of Russula virescens has small scales. Both are mild tasting. Can also be confused with the deadly poisonous Amanita phalloides with has a ring and is not a Russula.

Note the mushroom, as all other mushrooms with green cap, is not recommend to be eaten because it can be confused with the deadly poisonous Amanita phalloides (Death Cap).

Russula aeruginea on the First Nature Web site.','edible ');
INSERT INTO mushroom(name_eng, name_latin, description, edibility) VALUES ('IDKWTFISTHISSHITNIGGA                                      39','Russula acrifolia','Cap 5-20 cm diameter, stemp 2-8 cm tall * 1-4 cm thick. ','inedible');
INSERT INTO mushroom(name_eng, name_latin, description, edibility) VALUES ('IDKWTFISTHISSHITNIGGA                                      40','Rickenella swartzii','Cap 0.5-1 cm diameter, stem 2-4 cm tall * 0.1-0.2 cm thick. Rickenella swartzii is a tiny agaric that is pale fray to gray-brown. The cap center (navel) is almost black. The top of the stem is tinged dark violet. It grows in scattered trooping groups in lawns and other grasslands, typically with moss.','inedible');
INSERT INTO mushroom(name_eng, name_latin, description, edibility) VALUES ('Pine firefungus','Rhizina undulata','2-10 cm diameter. Rhizina undulata, also know as Pine firefungus, is a large, irregular, brown or black fungus that grows in fused clusters on conifer debris, particularly in old fire sites.

Fruiting bodyflat, with irregular lobes, and attached to the growing surface on the entire lower side by numerous whitish to yellowish rhizoids resembling plants roots. The margin is pale yellow (like the underside), and wavy and irregular. Surface sticky as moist. Flesh is reddish brown, tough and thick.
Occurrence It is grows infrequently from early summer to early autumn.
','inedible');
INSERT INTO mushroom(name_eng, name_latin, description, edibility) VALUES ('Liberty Cap','Psilocybe semilanceata','Cap 0.5-1.5 cm diameter, stem 2.5-7 cm tall * 0.1-0.2 cm thick. Psilocybe semilanceata, also known as Liberty Cap, is a hallucinogenic mushroom that contains the psychoactive compounds psilocybin. It has a distinctive yellowish pointed cap, clay or dark brown gills, and long slender stem. It grows in scattered trooping groups, on soil amongst grass in lawns and pastures favoring hilly sites.

Cap pallid ochraceous-brown, hygrophanous, drying buff and varies in shape from sharply conical to bell-shaped, often with a prominent papilla. It does not change shape considerably as it ages. The cap margin is initially rolled inward but unrolls to become straight or even curled upwards in maturity. Gills moderately crowded together, and they have a narrowly adnexed to almost free attachment to the stem. Spores are purplish brown. Stem slender yellowish-brown and usually slightly thicker towards the base.

Similar species Psilocybe fimetaria has a white veil at the margin. It grows in horse manure. There are also several other species the mushroom can be confused with.

Psilocybe semilanceata on the www.first-nature.com web site.','inedible');
INSERT INTO mushroom(name_eng, name_latin, description, edibility) VALUES ('Common Park Psathyrella','Psathyrella candolleana','Cap 2-6 cm diameter, stem 4-8 cm tall * 0.4-0.8 cm thick. Psathyrella candolleana, also known as Common Park Psathyrella,  is a smallish agaric that has a cap whose color varies between white and golden brown and the margin is irregular and radially asymmetrical, which is a defining characteristic of this species. It grows typically tufted on soil close to broad-leaf trees, also on stumps and other woody debris.

Cap convex to umbonate, yellow-brown in colour, as dry ivory white. The margin is thin and has veil remains as young. The flesh is white and thin. Gills at first pallid gray with lilaceous tinge, gray- to chocolate-brown as mature, adnate or adnexed, crowded. Spores are dark brown. Stem white, fragile, hollow and smooth. It has no ring.

Similar species The much darker Psathyrella spadiceogrisea occurs along forest paths and in similar sites in late spring and early summer.

Psathyrella candolleana on the First Nature Web site.
','inedible');
INSERT INTO mushroom(name_eng, name_latin, description, edibility) VALUES ('Dryad’s Saddle','Polyporus squamosus','Cap 10-60 cm diameter, 0.5-5 cm thick. Polyporus squamosus, also known as Cerioporus squamosus or Dryad’s Saddle, has a circular to fan-shaped bracket, covered with brown scales, a black stem positioned to one side, and a decurrent off-white to ocher tube layer. It grows annually, alone or in clusters of two or three, on broad-leaf trees, also on stumps, favouring beech, elm and sycamore.

Fruiting body can be yellow to brown and has "squamules" or scales on its upper side. On the underside it has whitish cream pores that are made up of tubes packed together closely. The tubes are between 5 and 10 mm long. The taste is not distinctive. Stem black, thick and short.

Polyporus squamosus on the Nature First Web site.','edible ');
INSERT INTO mushroom(name_eng, name_latin, description, edibility) VALUES ('Fringed Polypore','Polyporus ciliatus','Cap 2-12 cm diameter, stem 2-4 cm tall * 0.2-0.7 cm thick. Polyporus ciliatus, also known as Fringed Polypore, is a polypore that grows on fallen branches of deciduous trees annually on spring and early summer.

Fruiting body upper surface grayish brown or yellowish-brown, convex at first, flattening with a depressed (umbilicate) centre. Particularly towards the margin, the cap surface is usually covered in tiny bristly hairs. The flesh is white and leathery. Stem variable in colour, often pale yellowish brown or tawny-buff, more or less equal, typically curved and sometimes thickened at the base. Pores whitish cream to buff, circular, elongating with age.
','inedible');
INSERT INTO mushroom(name_eng, name_latin, description, edibility) VALUES ('Dry Scaly Pholiota','Pholiota squarrosa','Cap 3-12 cm diameter, stem 5-12 cm tall * 1-1.5 cm thick. Pholiota squarrosa, also known as Dry Scaly Pholiota, has a hat that is yellow-white and covered with brown scales. The gills are light yellow to brown. The foot is the same color as the hat and protruding scales. Grows on hardwood, often at the base of live or dead hardwoods.

Cap first bell-shaped to rounded and later somewhat flattened, yellowish-brown to tawny in older specimens. The scales on the cap are yellowish to tawny, and recurved. Flesh pallid yellow and firm. Gills are covered by a partial veil when young and have a greenish-brown color; mature gills are rusty brown and crowded closely together, attached to the stem (adnate), and usually notched (sinuate). Spores are brown. Stem colored as cap above, becoming tinged rust towards the base, more or less equal or tapering downwards, scaly as cap. The ring is ragged and almost zone-like.

Similar species Smaller and paler Pholiota squarrosoides is highly sticky-slimy beneath the scales. It also occurs on deciduous trees but is rare in Europe, more common in North America. Gymnopilys junonius found in the same habitat, lacks the distinctive cap scales.

Pholiota squarrosa on the Nature First Web site.','inedible');
INSERT INTO mushroom(name_eng, name_latin, description, edibility) VALUES ('Golden Scalycap','Pholiota aurivella','Cap 4-15 cm diameter, stem 5-18 cm tall * 0.5-1.5 cm thick. Pholiota aurivella, also known as Golden Scalycap, is a medium to large, orange-yellow, rounded agaric with scattered, reddish orange scales embedded in the surface.

Cap Bright yellow, convex to broadly humped. Surface scales embedded in a slime layer, sometimes disappearing in rain. Gills close, adnate (broadly attached) at first; yellowish to reddish brown. Spores are reddish-brown. Stem central or off center, cylindrical, solid, firm. Surface cottony above poorly developed ring, fibrillose to scaly below.

Similar species Pholiota jahnii and Pholiota limonella.','inedible');
INSERT INTO mushroom(name_eng, name_latin, description, edibility) VALUES ('Alder Scalycap','Pholiota alnicola','Cap 2-8 cm diameter, stem 2-8 cm tall * 0.5-1 cm diameter. Pholiota alnicola, also know as Alder Scalycap, has a yellow, or yellow with some green intermixed hat, lemon-yellow gills (becoming cinnamon), and a ring zone on stem. It grows solitary or more typically clustered on dead or dying decidous trees, such as alder or birch often in damp sites.

Cap is bright yellow or yellow with some green intermixed, often with rusty brown spots. Gills are adnate to slightly decurrent, straw-yellow to rust brown. Spores are brown. Stem yellow toward top and rusty brown toward base. Ring is zone-like with pallid remnants of veil, very superior.

Similar species Three forms of Pholiota alnicoloa are sometimes classified separately. Pholiota salicola grows on willow, and it tastes bitter; Pholiota flavida and Pholiota pinicola grow on conifers.

Pholiota alnicola on the First Nature Web site.','inedible');
INSERT INTO mushroom(name_eng, name_latin, description, edibility) VALUES ('IDKWTFISTHISSHITNIGGA                                      49','Phallus rubicundus','Cap 1-2 cm diameter; stem 3-12 cm tall x 0.5-3 cm diameter. Phallus rubicundus is a species in the stinkhorn family and has a wide distribution in tropical regions. It has the typical stinkhorn structure consisting of a spongy stalk up to 15 cm tall arising from a gelatinous "egg" up to 3 cm in diameter.

Fruiting body consist of a hollow cylindrical stalk supporting a conical to bell-shaped cap. The orange to scarlet stalk tapers towards to top, and has a pitted surface. The wrinled cap is scarlet red. It is initially covered with a foetid, slimy grayish-olive gleba.

Similar species Mutinus elegans does not have a clearly separated cap, and instead bears its gleba on the apex of its pointed stalk.
','inedible');
INSERT INTO mushroom(name_eng, name_latin, description, edibility) VALUES ('Poison Pax','Paxillus involutus','Cap 5-12 cm diameter, stem 3-7 cm tall * 0.8-1.2 cm diameter. Paxillus involutus, also know as Poison Pax, has a strongly inrolled, yellow- to red-brown cap, with a downy margin and slightly depressed center and ochre-brown gills. It grows solitary or in trooping groups on soil in leaf woods.

Cap initially convex then more funnel-shaped with a depressed centre and rolled rim, may be reddish-, yellowish- or olive-brown in colour. The surface is initially downy and later smooth, becoming sticky when wet. Gills brownish yellow, narrow, decurrent and forked, and can be peeled easily from the flesh. They further down toward the stem become more irregular and anastomose. Stem is similarly colored as the cap, however bruising darker brown. It is smooth, equal or tapering downwards. The mushroom has not ring.

Similar species Paxillus filamentous has a less incurved margin, yellow flesh, and occurs under alder.

Paxillus involutus on the First Nature Web site.
','poisonous');
INSERT INTO mushroom(name_eng, name_latin, description, edibility) VALUES ('Velvet Rollrim','Paxillus atrotomentosus','Cap 12-28 cm diameter, stem 3-9 cm tall * 2-5 cm thick. Paxillus atrotomentosus, also know as Tapinella atrotomentosa or Velvet Rollrim is a large or massive agaric that has a brown cap, buff gills and a dark brown, velvety, sometimes eccentric stem. Grows in woods and three stands, on and around conifer stumps and sometimes buried, coniferous wood.

Cap sepia- or walnut brown in colour with a inrolled cap margin and depressed centre. The cap is covered with dark brown or black velvety fur. Gills cream-yellow and forked, becoming ochre and spotted rust with age.
Spores are sienna-brown. Stem thick, dark brown and juts out sidewards from the mushroom. The mushroom has no ring.

Synonymes Tapinella atrotomentosa is the newer name.

Tapinella atrotomentosa on the First Nature Web site.','inedible');
INSERT INTO mushroom(name_eng, name_latin, description, edibility) VALUES ('Lemon-Peel Cup','Otidea onotica','4-6 cm diameter * 4-10 cm tall. Otidea onotica, also known as Lemon-Peel Cup, is a pinkish yellow, irregular cup formed fungus that grows solitary and in small trooping groups on soil in broad-leaf and mixed woods from spring to early autumn. It tends to grow under beech trees.

Fruiting body lemon-yellow to yellow or rosy orange. The ear-shaped cup is split down one side and has a stemlike, off-white base and wavy margin. The thin, pale flesh may develop rusty spots with age.

Similar species Otidea leporina is found mostly in conifer forests. The dark brown Otidea smithii is common in the Rocky Mountains. Wynnea americana, which grows from a sclerotial mass, is also dark brown but with a reddish inner surface.

Otidea onotica on the First Nature Web site.','inedible');
INSERT INTO mushroom(name_eng, name_latin, description, edibility) VALUES ('Poison Radish Ground Mycena','Mycena pura','Cap 2-6 cm diameter, stem 3-9 cm tall * 0.3-1 cm thick. Mycena pura, also know as the Poison Radish Ground Mycena, is a small or medium, variable agaric comes in many different colours, usually with purple tints. Some are considered separate species or varieties; all smell of radishes. It grows typically in wooded and open habitats on humus-rich soil.

Cap convex or bell-shaped, becoming flattened; the margin lined; bald; moist or dry; typically lilac to purple when young, but often fading or developing other shades. Gills adnexed to adnate, may be sinuate and notched; whitish or sometimes slightly pinkish to purplish; developing cross-veins with maturity. Spores the spore print is white. Stem  equal; hollow; smooth or with tiny hairs; usually similar coloured as the cap or paler. The mushroom has no ring.

Mycena pura on the First Nature Web site.','poisonous');
INSERT INTO mushroom(name_eng, name_latin, description, edibility) VALUES ('Common Tufted Mycena','Mycena galericulata','Cap 2-8 cm diameter, stem 5-10 cm tall * 0.2-0.4 cm thick. Mycena galericulata, also known as Common Tufted Mycena is a small or medium, grayish brown agaric that has a bell-shaped, radially grooved cap and pinkish gills.It grows in woods on the trunks, stumps and fallen branches of various types of decidous trees.

Cap roughly conical when young, becomes broadly bell-shaped or with a broad umbo. Margin initially somewhat curved inward, but soon evens out or even becomes uplifted, and often splits radially in age. Color is somewhat buff-brown on the margin, and fades gradually to pale dirty tan to dirty cinnamon-brown. Flesh is thick in the center of the cap and tapers evenly to the margin, and is watery gray. Gills narrowly attached (adnexed) to broadly attached or sinuate. The gill spacing ranges from close to somewhat distantly spaced, with 26–36 gills reaching the stem. Spores are pale cream colored. Stem is similarly colored as the cap but more pallid near the apex. It is smooth, slender, more or less equal, and somewhat rooting.  It has white hair. The mushroom has no ring.

Mycena galericulata on the Firs Nature Web site.','inedible');
INSERT INTO mushroom(name_eng, name_latin, description, edibility) VALUES ('Black Morel','Morchella elata','2-4 cm diameter * 5-15 cm tall. Morchella elata, also know as Black Morel, is like most members of the genus a popular edible fungus and is sought by many mushroom hunters. It has a conical cap with distinct black ridges and brown to smoky-grey pits. The stem is white with a rough, mealy or granular surface and hollow center.

Fruiting body is yellowish brown, with darker parallel longitudinal ribs that are connected to form honeycomb-like pits; while conical, it tapers downward into a creamy-white stem, more or less equal. Flesh is white, brittle, thin and hollow.

Similar species Morchella esculenta is yellow with pale ribs along the length of its cap. Gyromitra species, which are poisonous, lack the pitted cap. It has a chambered, rather than hollow, stem.','edible ');
INSERT INTO mushroom(name_eng, name_latin, description, edibility) VALUES ('Spring Cavalier','Melanoleuca cognata','Cap 4-10 cm diameter, stem 5-12 cm tall * 1-1.5 cm thick. Melanoleuca cognata, also know as Spring Cavalier, is a medium or large agaric, that is pale brown with an umbonate cap and white gills. It occurs often in the spring, when few other gilled mushrooms are fruiting, and grows solitary or scattered on soil in coniferous woods.

Cap buff to warm brown, umbonate. Flesh cream, soft and full. Gills crowded, sinuate, notched and pink to dark ocher colored. Spores cream colored. Stem rust colored with brownish fibrils, tapering slightly upwards from more or less bulbous base. The mushroom has not ring.

Melanoleuca cognata on the First NatureWeb site.','edible ');
INSERT INTO mushroom(name_eng, name_latin, description, edibility) VALUES ('Broad-gilled Collybia','Megacollybia platyphylla','Cap 4-12 cm diameter, stem 6-15 cm tall * 1.5-2 cm thick. Megacollybia platyphylla, also know as Broad-gilled Collybia, is a medium to large, fleshy agaric that has a pale brown, fibrillose cap, whitish gills and stem. It grows on buried decidous branches and stumps.

Cap mid- to pale brown, convex to umbonate. It has radiating fibers on dry cap surface. Gills medium-spaced, adnate or notched.  Spores are pale cream colored. Stem hollow at center and whitish, with darker fine fibrils that are less dense than on cap. It is more or less equal and thickened at base. It has no ring.

Similar species Pluteus cervinus has free gills and a salmon-pink spore print.','inedible');
INSERT INTO mushroom(name_eng, name_latin, description, edibility) VALUES ('Fairy Ring Marasmius','Marasmius oreades','Cap 2-5 cm diameter, stem 2-10 cm tall * 0.3-0.5 cm thick. Marasmius oreades, also known as Fairy Ring Marasmius, is a small agaric which is producing characteristic rings in turf. It has a bell-shaped to convex cap, which becomes flatter with a broad umbo with age.

Cap at first convex, then flat to cup shaped with a low central hump that is often a darker shade. Color varies from light beige to brown yellow. The margins are usually crinkled and almost transparent and streaky in damp weather. They turn lighter in dry weather, and regain their color in more humid conditions. The flesh is whitish buff, thick at the center, otherwise thin. Gills free, sparse, and convex in the center with horizontal ridges. Creamy white at fist, becoming ochraceous-cream, fairly broad and distant. Spores off-white. Stem tall, colored as cap, smooth or finely scurfy, slender, more or less equal, whitish downy at the base and slightly rooting, stiff. The mushroom has no ring.

Similar species The poisonous Clitocybe dealbata is found in the same grassy habitat. It is distinguished by its decurrent gills. Can also be mixed up with the very poisonous mushrooms Clitocybe rivulosa and Clitocybe dealbata.

Marasmius oreades on the First Nature Web site.','edible and good ');
INSERT INTO mushroom(name_eng, name_latin, description, edibility) VALUES ('Parasol Mushroom','Macrolepiota procera','Cap 10-25 cm diameter; stem 15-30 cm tall * 1-1.5 cm diameter. Macrolepiota procera, also known as the Parasol Mushroom, is a spectacularly large, distinctive, pale brownish agaric that has a scaly cap, white gills, and a pale brownish stem with a snakeskin pattern and ring. It grows solitary, scattered or clustered on soil in open grassy places and in mixed woods.

Cap pallid brown decorated with darker brown broad scales, starts off egg shaped and then bell shaped until the cap margin detaches from the stripe. The base colour becomes lighter with age. Dark scales appear on top when the brown surface cracks up from the smooth, central bump. Gills are white, free, and crowded. Flesh creamy white and soft. Stem is distinctive grey-brown with banded markings on a whitish background, long and thin with an onion shaped base. Above the dubble-edged ring that often falls off, it is evenly brown and below this, it is irregularly striped in a zigzag pattern. Ring is white above and brown below.

Similar species The poisonous Chlorophyllum molybdites has a stouter stalk and a green spore print.

Macrolepiota procera on the First Nature Web site.','edible ');
INSERT INTO mushroom(name_eng, name_latin, description, edibility) VALUES ('Shaggy Parasol Lepiota','Macrolepiota  rachodes','Cap 5-15 cm diameter; stem 10-15 cm tall * 1-1.5 cm diameter. Macrolepiota  rachodes, also know as Shaggy Parasol Lepiota, is a large, fleshy agaric with shaggy, pale grey-brown cap and whitish gem with ring and bulbous base. It grows solitary or scattered on in woods generally, often with conifers.

[Description is under work.]

Chlorophyllum rhacodes on the Firs Nature Web site.

Chlorophyllum rhacodes on the MushroomExpert.Com Web site.','poisonous');
INSERT INTO mushroom(name_eng, name_latin, description, edibility) VALUES ('Stump Puffball','Lycoperdon pyriforme','1.5-4 cm diameter, 1-5 cm tall. Lycoperdon pyriforme, also known as Stump Puffball, is identified by its elongated pear shape, its smooth surface at maturity, white cords at the base, and its occurrence on woody substrates (other in genus grows on the ground).

Fruiting body often pear-shaped, but may also be nearly spherical. When very young covered in small white spines that typically fall off before maturity. Colour ranges from nearly white to yellowish brown with the darker shades developing with age. Spore mass at first white and firm, becoming olive-brown and powdery. Spores are olive-brown.

Similar species Found in open, wooded areas, Lycoperdon lividium is also smooth, but is grayer and has warty spores (those of Lycoperdon pyriforme are almost smooth).

Lycoperdon pyriforme on the First Nature Web site.','edible ');
INSERT INTO mushroom(name_eng, name_latin, description, edibility) VALUES ('Common Puffball','Lycoperdon perlatum','2.5-6 cm diameter * 2-9 cm tall. Lycoperdon perlatum, also known as Common Puffball, is a yellowish brown rounded fungus, typically with a distinct stem and covered with short spines, each surrounded by smaller, grainlike scales. It grows typically in troops on soil in mixed woodland.

Fruiting body white, becoming ochre-brown, covered with short pyramidial warts which fall off to reveal endoperidium decorated with a reticulate patter; sub-spherical opening by an apical pore, the fertile head tapering down into a distinct, sterile, basal region. Spore mass at first white and firm, becoming olive-brown and powdery. Spores are pale yellow to olive-brown.

Similar species Lycoperdon nigrescens has longer, darker spines in groups, like those of the much longer-spined Lycoperdon echinatum. The surface of both has a similar pattern when the spines fall off.

Lycoperdon perlatum on the First Nature Web site.','edible ');
INSERT INTO mushroom(name_eng, name_latin, description, edibility) VALUES ('Dusky Puffball','Lycoperdon nigrescens','1-4 cm diameter * 1.5-3 cm tall. Lycoperdon nigrescens, also known as Dusky Puffball, is a rounded fungus, typically with a distinct stem and long dark spines. It typically grows in troops on acid soil on heaths and in coniferous and mixed woods.

Fruiting body is pallid brown covered with dark brown spines. They are fused in groups at the tips, falling away to reveal a brown papery surface decorated with a faint net pattern. Through a sub-spherical opening through a pore at the apex, the fertile head tapers or pinches down into a distinct, but very short, sterile, spongy basal region. Spore mass is at first white and firm becoming brown and powdery.  Spores are brown.','inedible');
INSERT INTO mushroom(name_eng, name_latin, description, edibility) VALUES ('Pistle-shaped Puffball','Lycoperdon excipuliforme','3-10 cm diameter * 8-20 cm tall. Lycoperdon excipuliforme, also know as Pistle-shaped Puffball, is a  pale buff or brown, pestle-shaped fungus that fruits most often singly or in very small groups in woodland habitats.

Fruiting body Covered with short spines and warts, the body falls away pallid buff becoming dull brown. When mature, the outer skin breaks open and brown spores are dispersed by wind and rain. When young and firm, the fruit-bodies are fairly tasteless yet edible. Stem slightly tapering in at the base; spongy; surface soon becoming wrinkled; initially white with pointed warts, but later turning ochre and becoming smooth and leathery.

Similar species Calvatia elata is widespread and common in North America. Lycoperdon molle resembles a short-stemmed specimen.

Synonyms Handkea excipuliformis','edible ');
INSERT INTO mushroom(name_eng, name_latin, description, edibility) VALUES ('Wood Blewit','Lepista nuda','Cap 6-12 cm diameter, stem 5-9 cm tall * 1.5-2.5 cm thick. Lepista nuda, also know as Clitocybe nuda or Wood Blewit, is a medium-sized, fleshy agaric, with a brownish cap and lilac gills. It grows in trooping groups, often in rings, in leaf litter in deciduous and mixed woodland and under hedgerows during autumn and winter.

Cap violet-brown, emerges dark and bun-shaped, becoming convex and then flattened. It''s colour becomes paler from the marigin as the cap surface dries. The flesh bluish lilac, thick, firm. Gills lilaceous, attached to the short, stout stem. Spores are pink. Stem colored as cap, more or less equal, fibrillose and often slightly thickened at the base. The mushroom has no ring.

Similar species Unrelated poisonous look-alikes include species of Entoloma, Cortinarius and Hebeloma. Cortinarius mushrooms often have the remains of a veil under their caps and a ring-like impression on their stem.

Clitocybe nuda on the First Nature Web site.','edible ');
INSERT INTO mushroom(name_eng, name_latin, description, edibility) VALUES ('Orange Birch Bolete','Leccinum versipelle','Cap 8-20 cm diameter, stem 8-20 cm tall * 1.5-4 cm thick. Leccinum versipelle, also known as Orange Birch Bolete, is a large or massive bolete, that can weigh up to 1.5 kg and has a distinctive orange cap, grayish yellow pores and a scaly stem. It grows solitary or in small scattered groups on soil specifically under birch trees and on heaths.

Cap clear orange or red brown. Round to start with, then oval and finally convex. Grainy or smooth as dry, and sticky when damp. The orange cap skin hangs down over the margin. Pores are circular and small. They are at first whitish, then buff, darkening rust where bruised. Tubes are similarly colored as the pores, wine colored where cut, and depressed. Spores are ocher-brown. Stem black tufts on a gray-white base that get sparser with age and often thicker at the base. The mushroom has no ring.
','edible ');
INSERT INTO mushroom(name_eng, name_latin, description, edibility) VALUES ('Brown Birch Bolete','Leccinum scabrum','Cap 5-15 cm diameter, stem 6-15 cm tall * 1.5-3 cm diameter. Leccinum scabrum, also know as Brown Birch Bolete, is a medium to large bolete that has a brown cap with gray-white pores and a white to gray stem covered with with gray-black scales. It grows specifically with birch, often on damp gound.

Cap brown, with reddish or grayish tinges; convex or bun-shaped, at first finely downy, becoming smooth, somewhat scurfy when older. Flesh dirty white, unchanging, thick and firm. Pores dirty white or grayish brown, circular, small. Tubes same color as pores, adnate. Spores are ocher-brown. Stem whitish, covered with gray-brown scales, more or less equal or tapering slightly upwards. Ring absent.

Similar species Distinguishing between Leccinum scabrum and its near relatives is difficult, and Leccinum scabrum is often used as a collective name for all brown capped Leccinum species like Leccinum variicolor.
','edible ');
INSERT INTO mushroom(name_eng, name_latin, description, edibility) VALUES ('Orange Oak Bolete','Leccinum aurantiacum','Cap 5-10 cm diameter, stem 8-14 cm tall * 1.5-4.5 cm thick. Leccinum aurantiacum, also known as Orange Oak Bolete, is a large or massive bolete that has a bun shaped orange cap, whitish pores and a scaly stem, which is darkening throughout where cut or bruised. It grows solitary or in small scattered groups on soil specifically under aspen.

Cap bright orange skin, at first round like a ball, then ovate or bun-shaped. It is sticky when damp and has, just like Leccinum versipelle, a larger skin that hangs down or is tucked under the margin of the cap. Flesh creamy-white then vinaceous or sepia where cut. Thick and firm. Pores white or cream, darkening vinaceous where bruised, circular. very small. Spores are ochraceous-buff. Stem dirty white, covered with woolly scales in irregular network, at first white then rust, stoutish, more or less equal or swollen towards base. The mushroom has no ring.

Similar species The most similar species is Leccinum versipelle, which differing from Leccinum aurantiacum grows under birch trees.
','edible ');
INSERT INTO mushroom(name_eng, name_latin, description, edibility) VALUES ('Chicken of the Woods','Laetiporus sulphureus','Cap 5 to 60 cm in diameter and 4 cm thick. The fruit bodies of this mushroom grow as striking golden-yellow shelf-like structures on tree trunks and branches. The undersurface of the fruit body is made up of tubelike pores rather than gills.

Fruiting body attached directly to the trunk of a tree and is initially knob-shaped, later expands to fan-shaped, typically overlapping shelves with thick margin. The upper surface color ranges from bright whitish-yellow to bright whitish-orange. Flesh soft and coloured as cap surface. Old fruitbodies fade to tan or whitish. The under surface is sulphur-yellow with small pores or tubes and has a white spore print. When fresh, the flesh is succulent and exudes a yellowish juice, but soon becomes dry and brittle. It has a strong, fungusy smell.

Laetiporus sulphureus on the First Nature Web site.','edible ');
INSERT INTO mushroom(name_eng, name_latin, description, edibility) VALUES ('Luscious Lactarius','Lactarius volemus','Cap 5-11 cm diameter, stem 4-12 cm tall * 1-3 cm diameter. Lactarius volemus, also know as Luscious Lactarius, is a very fleshy, matte orange agaric that has a thin, cracking skin on its cap and a thick, velvety pale orange stem. When cut, it''s off-white, mild-tasting flesh produces white milk.

Cap dry and velvety with a powdery matte texture and never sticky. Matte orange to red-brown coloured. At first slightly convex and develops a depression in the center later. The margin stays inrolled for some time. Gills creamy white, broadly attached to the stem slightly extending downward and densely packed. Turns brown when bruised. White drops often hangs under the gills. Stem is similarly colored as the cap but more pallid. Tapers off and darkens towards the base. It has no ring.

Similar species Lactarius hygrophoroides is a good edible lacking the odor. It is equally common in eastern North America. It does not stain and has distant gills.','edible and good ');
INSERT INTO mushroom(name_eng, name_latin, description, edibility) VALUES ('Ugly Milkcap','Lactarius turpis','Cap 5-15 cm diameter, stem 4-8 cm tall * 1-2.5 cm thick. Lactarius turpis, also know as Ugly Milkcap, is a large, dull olive-brown agaric which is typically slimy or sticky and exudes white milk. The appearance is distinctive and the English name is very appropriate. It grows solitary or in scattered groups on soil in damp places under birch.

Cap margin at first involute with a somewhat depressed centre. The upper surface is olive brown or yellow-green and is often sticky or slimy in the middle. When young it has velvety zones and may be shaggy at the rim. Later it becomes funnel-shaped and the colour darkens to blackish. Gills dirty white, stained olive-brown by old milk. Initially white. They are fairly narrow, crowed and extending downward. Stem similar in colour as the cap, but much lighter.','inedible');
INSERT INTO mushroom(name_eng, name_latin, description, edibility) VALUES ('Slimy Lead Lactarius','Lactarius trivialis','Cap 6-15 cm diameter, stem 6-12 cm tall * 1-2 cm thick. Lactarius trivialis, also known as the Slimy Lead Lactarius, is an agaric that has a large fleshy cap that is often spotted or fainty concentrically zoned and pale gills and stem. It exudes white milk and grows solitary or in scattered groups on boggy soil under coniferous trees and birches.

Cap smooth, greasy, later depressed in the center and at first purplish violet with darker zones, becoming brownish gray or pinkish beige. Gills pale cream, crowded and slightly decurrent. Spores are pale yellow. Stem may be quite long, pallid with tint of cap colour and later often hollow. The mushroom has no ring.

Similar species Lactarius argillaceflius grows in eastern North America under oaks with gills that stain and age brownish.
','edible when boiled ');
INSERT INTO mushroom(name_eng, name_latin, description, edibility) VALUES ('Woolly Milkcap','Lactarius torminosus','Cap 4-12 cm diameter, stem 4-8 cm tall * 1-2 cm thick. Lactarius torminosus, also know as Woolly Milkcap, is a largish, salmon-pink, distinctively woolly agaric that exudes white milk. The mushroom is mycorrhizal with birch and often found in open, grassy sites.

Cap at first round with a slightly depressed center and rolled-in margin. Then shallow to severely funnel shaped. It has a shaggy surface that has zones in shades of orange and orange-brown. Gills are pallid buff or salmon, extending downward, narrow, and crowded. Spores are pale yellowish cream. Stem is similarly colored as the cap but more pallid. It is short, smooth more or less equal or tapering at both ends. The mushroom has no ring.

Similar species Lactarius pubescens is paler with fainter zones.  It has a less shaggy cap. Lactarius scoticus is smaller and also pale.
','edible when boiled ');
INSERT INTO mushroom(name_eng, name_latin, description, edibility) VALUES ('Birch Milkcap','Lactarius tabidus','Cap 2-4 cm diameter, stem 3-5 cm tall * 0.4-1 cm thick. Lactarius tabidus, also known as Birch Milkcap, is a small agaric with orange-brown cap, cinnamon gills that exudes white milk. It grows solitary or in scattered groups on soil under broad-leaf trees, favouring birch.

Cap convex, sometimes with a central umbo, that flattens with age. It varies between orange-brown and a dull chestnut in colour, and the surface is dry and matt. The margin is often has tiny lobes, and can be crimped or crisped. Gills at first ochraceous-buff, becoming cinnamon, adnate or slightly decurrent, narrow and fairly crowded. Spores are cream coloured. Stem colour varies between a reddish-brown and brick coloured, is more or less equal or tapering slightly upwards. The mushroom has no ring.

Similar species other small Lactarius species.
','inedible');
INSERT INTO mushroom(name_eng, name_latin, description, edibility) VALUES ('Red-hot Lactarius','Lactarius rufus','Cap 3-10 cm diameter, stem 4-8 cm tall * 0.5-2 cm thick. Lactarius rufus, also know as Red-hot Lactarius, is a small to medium-sized agaric has a dull reddish brown cap, creamy white gills and exudes milk that remains white. The flesh tastes very hot after about 30 seconds, but can be eaten only after being salted and then pickled.

Cap dry and velvety with a powdery matte texture and never sticky. It is reddish or bay-brown coloured, at first convex with inrolled margin, later flattened or slightly depressed typically with a small central umbo, Gills first creamy white, later more similarly colored as the cap, sub-decurrent, which means they travel partially down the stem and are fairly crowded. Spores are off white. Stem is similarly colored as the cap or more pallid, smooth and tapers off and darkens toward the base. The mushroom has no ring.

Similar species Lactarus hepaticus exudes white milk that stains yellow as it dries.
','edible when boiled ');
INSERT INTO mushroom(name_eng, name_latin, description, edibility) VALUES ('IDKWTFISTHISSHITNIGGA                                      76','Lactarius mammosus','Cap 2.5-5.5 cm diameter; stem 3-7 cm tall x 0.5-1 cm diameter. Lactarius mammosus is a largish agaric that has a gray cap and pale gills and stem and exudes white milk. It grows solitary or in scattered groups on boggy soil under coniferous trees, mainly pine.

Cap convex, later flattening or with a depression, sometimes with a fiat to pointed umbo, margin at first somewhat inrolled; brownish, vinaceous-grey to umber or hazel, sometimes with one or more concentric bands; moderately thick, firm, surface dry, of feathery, adpressed fibres breaking into small, low, fibrous scales. Gills adnate to slightly decurrent, crowded; rosy buff, later darker with an orange tinge. Milk white; taste mild, then hot or very hot, smell of coconut.Spores Spore print cream. Flesh whitish to buff. Stem whitish or tinged with the cap colour, bruising pale cinnamon-brown. It has no ring.','edible ');
INSERT INTO mushroom(name_eng, name_latin, description, edibility) VALUES ('Rufous Milkcap','Lactarius lignyotus','Cap 2-10 cm diameter, stem 4-12 cm tall * 0.8 - 1.5 cm thick. Lactarius lignyotus, also known as Rufous Milkcap, is a dark brown, velvety Lactarius that grows under conifers and features fairly well-spaced gills, a long stem that is nearly as dark as the cap. It exudes white milk that usually stains the flesh and the gills pinkish.

Cap mid-to dark brown with a velvety surface. As young with an inrolled margin, becoming flat or shallowly depressed, often with a central depression. Gills very slightly decurrent, close or nearly distant; white or whitish, remaining pale until old age, when pinkish to orangish hues often result from drying milk and spore maturation. Stem pale brown to almost white with white base. More or less equal. The mushroom has no ring.

Similar species Lactarius fuliginosus has a light brown stem, and the hat color is dark brown.
','inedible');
INSERT INTO mushroom(name_eng, name_latin, description, edibility) VALUES ('Poison Lactarius','Lactarius helvus','Cap 4-10 cm diameter; stem 3-6 cm tall * 1-2.3 cm diameter. Lactarius helvus, also known as Poison Lactarius, is a medium-sized or large agaric that has a spicy smell, similar to curry. It has a cinnamon-brown cap, buff gills and excluding colourless, transparent milk. It grows solitary or in scattered groups on soil.

Cap velvety, initially slightly convex, becoming funnel-shaped as it matures and has a faint zonate (bull''s-eye) pattern, beige or light grey at the margins and darkening toward the centre. Gills decurrent, first cream coloured, then darkening to ochre-yellow. The flesh is white or beige, often pink-tinged. Stem  is similarly colored as the cap or more reddish brown, more or less equal. The mushroom has no ring.

Similar species Lactarius aquifluus is very similar in appearance and grows in North America.

','poisonous');
INSERT INTO mushroom(name_eng, name_latin, description, edibility) VALUES ('Orange milkcap','Lactarius deterrimus','Cap 3-10 cm diameter, stem 3-6 cm tall * 1.5 - 2 cm diameter. Lactarius deterrimus, also know as Orange milkcap, is a medium to large agaric that has smooth stem, pale carrot gills and exudes green staining orange milk. It grows by itself or in groups scattered throughout soil under conifers, particularly pine and spruce trees.

Cap first round with a slightly depressed center and rolled-in margin. Then shallow to funnel shaped. It has orange coloured zones that turn greener with age. Sticky or slippery when wet. Gills dense and slightly extending downward. Same colour as cap. Stem is similar in color as the cap, smooth, Tough, but at the same time delicate and fragile. Flesh dirty gray colored. It turns orange at the edges because of the carrot coloured milky liquid that escapes when broken. The mushroom has no ring.

Similar species Lactarius deliciosus which grows with pine trees and the poisonous Lactarius helvus.

Lactarius deterrimus on the First Nature Web site.
','edible ');
INSERT INTO mushroom(name_eng, name_latin, description, edibility) VALUES ('Saffron Milkcap','Lactarius deliciosus','Cap 3-10 cm diameter, stem 3-6 cm tall * 1.5 - 2 cm diameter. Lactarius deliciosus, also known as Saffron Milkcap, is an attractive, fairly large, buff agaric with distinctive salmon -pink blotches, pale carrot coloured gills. The mushroom exudes carroty milk, which is a significant characteristic for this mushroom. It grows grows solitary or in scattered groups on soil under conifers, favouring pine trees.

Cap first round and bumpy, then convex and as mature flat with a depressed center. The margin stays rolled in until maturity. It has concentrically zoned thin rings in orange and somewhat wider zone in salmon go gray pink. Often with carrot colored patches. Sticky and slippery when wet. Gills at first apricot or saffron, becoming carrot, dull green on bruising, dense and sub-decurrent before abruptly ending. Stem similarly coloured as cap, thick and hard but also fragile, more or less equal, and patterned with different-sized shallow holes in a darker shade.

Similar species Lactarius deterrimus found with spruce trees has a smooth stem and exudes green staining orange milk.

Lactarius "deliciosus" group on the First Nature Web site.','edible and good ');
INSERT INTO mushroom(name_eng, name_latin, description, edibility) VALUES ('Curry Milkcap','Lactarius camphoratus','Cap 2.5-5 cm diameter, stem 3-5 cm tall * 0.4-0.7 cm thick. Lactarius camphoratus, also known as Curry Milkcap, is a smallish agaric with dark red-brown cap, pale gills and exudes white milk which savor of curry. It grows with conifers and deciduous trees, favoring acidic, well drained soil.

Cap dark red-brown with central depression or umbo and a furrowed margin. Gills decurrent, medium-spaced and quite thick. Spores are white to cream colored. Stem is pallid and similarly colored as the cap, more or less equal, and finely downy and becoming hollow. The mushroom has no ring.

Similar species Lactarius rufus and Lactarius helvus have a similar smell.

Lactarius camphoratus on the First Nature Web site.','inedible');
INSERT INTO mushroom(name_eng, name_latin, description, edibility) VALUES ('Common Laccaria','Laccaria laccata','Cap 1.5-6 cm diameter, stem 5-10 cm tall * 0.6-1 cm thick. Laccaria laccata, also know as Common Laccaria, is a a smallish agaric which is reddish brown throughout and has distant thickish gills and a fibrous stem. It grows in scattered trooping groups on soil in mixed woods and on heaths.

Cap typically reddish brow, but may be shades of pink-brown. It has a toothed margin and a slight depression in the center. Gills colored as cap, but becoming powdered white with spores, adnate, thick, broad distant. Stem colored as cap, robust and strongly fibrillose, often twisted and laterally compressed. The mushroom has no ring.

Similar species Laccaria bicolor has contrasting, pale blue gills. Laccaria proxima is larger with more fibrillose stem. Laccaria ochropurpurea is much larger and has purple gills.


Laccaria laccata on the First Nature Web site.
','edible ');
INSERT INTO mushroom(name_eng, name_latin, description, edibility) VALUES ('Sheathed Woodtuft','Kuehneromyces mutabilis','Cap 3-6 cm diameter, stem 3-8 cm tall * 0.5-1 cm thick. Kuehneromyces mutabilis, also known as Sheathed Woodtuft, is a medium-sized agaric that has a bright tan cap which becomes paler from the centre when drying. It also has yellowish or reddish brown gills and a ring on the stem. It grows clustered on stumps and logs of broad-leaf trees, favoring birch.

Cap convex, becoming flattened with a blunt umbo, and hygrophanous; as damp shiny and greasy with a deep orange-brown colour towards the rim; often there is a disc of lighter flesh in the middle. Cinnamon-coloured as dry. Gills initially light and later cinnamon brown and broadly attached to the stem and crowded. Sometimes somewhat decurrent. Spores are ochre-brown. Stem pale and smooth light cinnamon above the ring and below darker brown shaggily scaly.

Similar species A group of poisonous Galerina species are similar. Galerina are unicolor and Galerina marginata have fibers and no stem scales.

Warning: This mushroom is not recommended to be picked as food because it can be confused with the deadly poisonous Galerina marginata.

Kuehneromyces mutabilis on the First Nature Web site.','edible ');
INSERT INTO mushroom(name_eng, name_latin, description, edibility) VALUES ('Torn-cap Inocybe','Inocybe lacera','Cap 1-4 cm diameter, stem 2-4 cm tall * 0.2-0.5 cm thick. Inocybe lacera, also know as Torn-cap Inocybe, is in appearance a typical "little brown mushroom", but specific features are very variable. It grows often on sandy soil with coniferous trees and on old moss-covered fire sites.

Cap snuff-brown, typically convex with a small umbo, fibrillose and scaley. The margin curves inwards, and often splits. Flesh is whitish and unchanging. Gills are cream colored in younger specimens, becoming grey-brown with whitish edges. They are notched at the margin or reach towards but are not attached to the stem. Spores are tobacco brown. Stem brown at the slightly bulbous base, but lighter towards the apex, and fibrillose. The mushroom has no ring.

Similar species Inocybe lanuginosa has a woollier stem and spores with nodules.

','poisonous');
INSERT INTO mushroom(name_eng, name_latin, description, edibility) VALUES ('Snakeskin Brownie','Hypholoma marginatum','Cap 1.5-4 cm diameter; stem 3-7 cm tall x 0.2-0.5 cm thick. Hypholoma marginatum, also known as Snakeskin Brownie, is a smallish agaric with tan cap, stem with silvery mottled appearance and yellow or olive-brown gills and no ring zone. It grows in small trooping groups on needles or rotting wood with coniferous trees.

Cap  convex, flattening out at maturity but retaining a shallow umbo; inrolled margin of young caps is covered with silky remnants of the partial veil; colour rather variable but most often brick red in the centre and paler towards the margin. Gills at first pallid yellow, then olivaceous-brown, adnate or emarginate, crowded. Spores chocolate-brown. Stem fibrous; light ochre at apex, darkening progressively to a reddish-brown base; a faint ring zone is usually discernable.
','inedible');
INSERT INTO mushroom(name_eng, name_latin, description, edibility) VALUES ('Sulphur Tuft','Hypholoma fasciculare','Cap 2-7 cm diameter, 4-10 cm tall * 0.5-1 cm diameter. Hypholoma fasciculare, also known as Sulphur Tuft Mushroom, is a medium-sized agaric that has a yellowish tan cap and stem, sulphur or blackish brown gills, and a faint ring zone. It often grows in clusters on stumps of broad-leaf and coniferous trees.

Cap convex, sulphur-yellow with darker orange center. It is expanded with age, smooth but with velar remnants attached to the margin. Flesh is sulphur-yellow, firm and moderate. Gills green sheen on greenish yellow to alove-brown, crowded, adnate.
Stem is more or less similarly colored as the cap, but it is darker brown towards the base. Ring is zone-like, faint, and with maturity same color as spores.

Hypholoma fasciculare on the First Nature Web site.','poisonous');
INSERT INTO mushroom(name_eng, name_latin, description, edibility) VALUES ('Conifer Tuft','Hypholoma capnoides','Cap 3-7 cm diameter, stem 5-8 cm tall, 0.5-1 cm thick. Hypholoma capnoides, also known as Conifer Tuft, is a small or medium sized agaric that has a yellowish orange cap and has veil remnants visible at the pale margin. It is greasy when wet.

Cap yellow to orange or brownish colour with pale yellow flesh. Gills initially pale orangish-yellow, pale grey when mature, later darker purple/brown. Spore print dark burgundy/brown. Stem yellowish, somewhat rust-brown below.

Similar species  Hypholoma fasciculare and Hypholoma sublateritium, which are poisonous, also Hypholoma radicosum which is much rarer but is found in similar sites.

Hypholoma capnoides on the First Nature Web site.','inedible');
INSERT INTO mushroom(name_eng, name_latin, description, edibility) VALUES ('Late Fall Wax Cap','Hygrophorus hypothejus','Cap 3-7 cm diameter, stem 4-7 cm tall * 0.7-1.4 cm thick. Hygrophorus hypothejus, also known as Late Fall Wax Cap, is a smallish, slimy agaric that has a dull brown cap and distinctive yellowish gills and stem. It grows in trooping groups on soil in pine woods from late autumn to winter.

Cap first convex and then flat. Dull olive-brown coloured and center is darker and often concave. The margins stay rolled in for some time. It is covered with a thick, glassy layer of slime, disappearing with age. It becomes very sticky in damp weather.
Gills goes down the stem and are sparse and elastic. At first mild vanilla to butter yellow coloured, and turns orange as mature. Spores are white. Stem is pallid yellow, sometimes tinged with orange, tall and usually thin, more or less equal or tapering slightly downwards. It is sticky below the ring zone. The mushroom has no ring.

Similar species Hygrophorus locorum is bright yellow and associated with larch. Several other Hygrophorus species, found with pine, are distinguished from Hygrophorus hypothejus by their different coloring.','edible ');
INSERT INTO mushroom(name_eng, name_latin, description, edibility) VALUES ('Arched Wood Wax','Hygrophorus camarophyllus','Cap 2-7 cm diameter, stem 2.5 - 13 cm tall * 1 - 2 cm thick. Hygrophorus camarophyllus, also known as Arched Wood Wax, is a medium-sized agaric which is distinct because of the dry, streaked cap, white, waxy gills that contrast beautifully with the carbon-brown cap and stem.

Cap umbonate and often with a raised boss in center of cap, carbon-brown to gray-black with dark radial streaks. Gills decurrent, sparse, waxy, first white, with age white-gray. Stem top often brighter than other stem but not always, otherwise greyish with ingrown threads, cylindrical or narrowed downward, solid to stuffed. Flesh white, brittle, with mild flavor and pleasant aroma.
 Grows in mossy pine forests all over Scandinavia. Has a fairly modest taste but still a delicacy.','edible ');
INSERT INTO mushroom(name_eng, name_latin, description, edibility) VALUES ('False Chanterelle','Hygrophoropsis aurantiaca','Cap 2-8 cm diameter, stem 3-5 cm tall * 0.5-1 cm thick. Hygrophoropsis aurantiaca, also commonly knows as False Chanterelle, is a smallish orange-yellow agaric that has a shallowly funnel-shaped cap reminiscent of a chanterelle but with true gills. It grows typically among needle litter, rotten wood, or sawdust.

Cap golden-orange, initially convex but becoming funnel-shaped as the mushroom matures. The cap margin, which remains rolled in a little, becomes wavy or lobed in age. The cap surface is covered with a fine down. Gills decurrent, narrow and forked, which is a distinctive and distinguishing feature. They are generally a more intense shade of orange than the cap. Stem  is similarly colored as the cap. It is stout, more or less equal, smooth, and typically curved. The gills may be slightly crimped along the stem. The mushroom has no ring.

Similar species Cantharellus cibarius, Omphalotus olearius
','inedible');
INSERT INTO mushroom(name_eng, name_latin, description, edibility) VALUES ('Terracotta Hedgehog','Hydnum rufescens','Cap 2-6 cm diameter, stem 1.5-4 cm diameter * 0.8-1.5 cm tall. Hydnum rufescens, also known as Terracotta Hedgehog, is a small or medium-sized fruiting body is similar to that of Hydnum repandum but is smaller, thinner and salmon pink colored. It grows on soil in broad-leaf or coniferous woods.

Fruiting body is salmon-pink. Cap is smooth or faintly downy; it is at first convex with inrolled margin, becoming flattened and often slightly funnel-shaped. Margin remains incurved. Stem is stout, more or less equal, sometimes eccentric, and finely downy. Flesh is pinkish, soft, thick and rather crumbly. Spines are salmon pink and broadly attached to the stem. Spores are glassy in color.

Similar species Hydnum repandum.','edible ');
INSERT INTO mushroom(name_eng, name_latin, description, edibility) VALUES ('Common Hedgehog Tooth','Hydnum repandum','Cap 3-10 cm diameter; stem 2-6 cm tall * 1.5-3 cm diameter. Hydnum repandum, also known as Common Hedgehog Tooth, is a medium-sized to large, fleshy mushroom with pale whitish to pale orange-yellow cap. It grows on soil in broad-leaf or coniferous woods.

Fruiting body orange-, yellow- or tan-colored, irregular in shape (it may be convex or concave at maturity), with a wavy margin that is rolled inward when young. The cap surface is generally dry and smooth, although mature specimens may show cracking. Viewed from above, the caps of mature specimens resemble somewhat those of chanterelles. The flesh is thick, white, firm, brittle, and bruises yellow to orange-brown. The underside is densely covered with small, slender off-white to pinkish spines measuring 2–7 mm long. These spines sometimes run down at least one side of the stem. Odor not distinctive. Stem Thick, central of off center; colored like cap or lighter.

Similar species
Hydnum albidum has a white cap, smaller spores, and occurs on alkaline soil. Closely related Hydnum refescens is smaller and orange.

Hydnum repandum on the MushroomExpert.Com Web site.','edible and excellent ');
INSERT INTO mushroom(name_eng, name_latin, description, edibility) VALUES ('Ruby Bolete','Hortiboletus rubellus','Cap 6 cm; stem 7,5 cm tall * 1-3 cm diameter. Hortiboletus rubellus, also known as Xerocomellus rubellus or Ruby Bolete, is a relatively small bolete with scarlet to raspberry red cap, reddish stem and and yellow pores, occurring largely with oak.

Cap scarlet to raspberry red when young, with a dry velvety texture. The extreme margin often has a pale yellow or white band around it, and it discolours darker, and dirtier with age. Pores small; pale yellow, and bruise slowly. Spores the spore print is olive. Stem  slender and long. It is lemon yellow at the apex, but red elsewhere, and has a tendency to split or sheer vertically.

Similar species Hortiboletus Simonini.

Hortiboletus rubellus on the www.first-nature.com web site.

Xerocomellus rubellus on the MushroomExpert.Com Web site.','inedible');
INSERT INTO mushroom(name_eng, name_latin, description, edibility) VALUES ('Lion''s mane','Hericium erinaceus','Body 8–16 cm across, spines 1-5 cm long. Hericium erinaceus, also known as Lion''s mane, is an large, edible mushroom belonging to the tooth fungus group. It grows on cracks or knot holes of living hardwoods, most often oaks in late summer and fall.

Fruiting body consists of one, often roundish fruitbody with 1-5 cm long, soft spines hanging from a tough, hidden base that is attached to the tree. The spines are white, or in age discoloring brownish to yellowish. Stem very short if present.

Similar species Hericium coralloides is found only on wood of conifers and has coarser branches and longer spines in tufts, not in continous rows along lower surfaces.

Hericium erinaceus on the MushroomExpert.Com Web site.
','edible ');
INSERT INTO mushroom(name_eng, name_latin, description, edibility) VALUES ('Veiled Poisonpie','Hebeloma mesophaeum','Cap 2.5-4.5 cm diameter, stem 4-7 cm tall * 0.3-0.4 cm thick. Hebeloma mesophaeum, also known as Veiled Poisonpie, is a smallish agaric that has a greasy cap with dark brown centre and paler margin, clay gills and pale stem with ring. It grows solitary or in small groups on soil, with conifers, less frequently with broad-leaf trees on late summer to autumn. The mushroom is moderately poisonous.

Cap dry, or slightly greasy, gray-brown, darker chocolate-brown toward center with pallid whitish margin decorated with fibrous velar remnants when young. Gills notched, medium spaced and pale brown coloured.  Spores are rust colored.  Flesh brownish, firm and stuffed. Stem pallid buff, becoming tinged brown with age, more or less equal, sometimes with a faint or more prominent ring zone.

Hebeloma mesophaeum on the First Nature Web site.','poisonous');
INSERT INTO mushroom(name_eng, name_latin, description, edibility) VALUES ('Poison Pie','Hebeloma crustuliniforme','Cap 2-10 cm diameter, stem 4-7 cm tall * 1-2 cm thick. Hebeloma crustuliniforme, also known as Poison Pie, is a medium to large agaric with buff or tan, greasy cap, clay gills and stoutish, pale stem. It grows solitary or in small groups on soil in open mixed woodland. The mushroom is moderately poisonous.

Cap buff to pale tan, convex then umbonate with an inrolled cap margin until old. Gills pale grey-brown and exude droplets in moist conditions, adnate or adnexed, crowded. Spores are rust colored. Stem whitish, fairly stout, more or less equal, granular towards apex and the thick flesh is white. The mushroom has no ring.

Hebeloma crustuliniforme on the First Nature Web site.','poisonous');
INSERT INTO mushroom(name_eng, name_latin, description, edibility) VALUES ('Hooded false morel','Gyromitra infula','2-8 cm diameter, 2-13 cm tall, including stem. Gyromitra infula, also known as Hooded false morel, occurs in late summer and fall, not in the spring, when other species of Gyromitra can be found. Its broadly lobed cap is usually pinched into two lobes, creating a saddle-shaped appearance. Its color is variable.

Fruiting body occasionally nearly cup-shaped when young, but soon becoming lobed with two prominently raised lobes; bald; loosely wrinkled but usually not not brainlike; varies in color (tan to yellowish brown to reddish brown to dark brown); undersurface whitish to brownish, finely dusted, sometimes ingrown with stem where contact occurs. Stem equal to enlarged at the base, stuffed or hollow, round to compressed, sometimes with a longitudinal fold, surface glabrous to subpubescent, colored like the cap or lighter.

Similar species The deadly poisonous Gyromitra esculenta reminds of this mushroom.','poisonous');
INSERT INTO mushroom(name_eng, name_latin, description, edibility) VALUES ('False Morel','Gyromitra esculenta','5-15 cm diameter, 5-12 cm tall, including stem. Gyromitra esculenta, also know as False Morel, has a fruiting body that consists of an irregular, brown, brain-like structure on a pale stem. It grows solitary or in small trooping groups near conifers (pines), typically on acid, sandy soils.

The irregularly shaped Fruiting body reminds of a brain structure. Initially smooth, it becomes progressively more wrinkled as it grows and ages. The cap colour may be various shades of reddish-, chestnut-, purplish-, bay-, dark or sometimes golden-brown. Stem attached to the cap at several points. Gyromitra esculenta has a solid stipe whereas those of true morels (Morchella spp.) are hollow. The spore print is whitish.

Warning This mushroom is deadly poisonous. Toxins allegedly lost after thorough cooking but, if ingested, the effect is probably cumulative with no immediate symptoms.

Similar species Gyromitra gigas, Gyromitra brunna, Gyromitra caroliniana and Gyromitra korfii are often larger and more vivid orange-brown; common in parts of North America.

Gyromitra esculenta on the MushroomExpert.Com Web site.
','lethally poisonous');
INSERT INTO mushroom(name_eng, name_latin, description, edibility) VALUES ('Slimy Spike','Gomphidius glutinosus','Cap 3-5 cm diameter, stem 2.5-4.5 cm tall * 0.4-1 cm thick. Gomphidius glutinosus, also known as Slimy Spike, is a gray-brown agaric that is covered in a colorless, slimy veil. The stem has an indistinct ring zone, often stained black by spores, and its base is lemon-yellow. The mushroom is mycorrhizal with spruse.

Cap gray-brown, convex or bun shaped, becoming expanded and flattened, heavily viscid when damp, becoming shiny when dry. Flesh dirty white, moderate and firm. Gills at first whitish, becoming tinged olivaceous-grey when mature, deeply decurrent, thick. Stem dirty white, more or less equal, lemon yellow at base. Ring white, glutinous, zone-like.
','edible ');
INSERT INTO mushroom(name_eng, name_latin, description, edibility) VALUES ('Funeral Bell','Galerina marginata','Cap 2.5-6.5 cm diameter, stem 3-9 cm tall * 0.3-0.8 cm diameter. Galerina marginata, also known as Funeral Bell, is a small agaric with yellowish tan, sticky cap, similarly colored as the gills and a ring on the stem. It grows in clusters on stumps and logs of broad-leaf trees.

Cap starts convex, sometimes broadly conical, and has edges (margins) that are curved in against the gills. It becomes later broadly convex and then flattened, sometimes developing a central elevation, or umbo. Gills typically narrow and crowded, with a broadly adnate to nearly decurrent attachment to the stem and convex edges. They are a pallid brown when young, becoming tawny at maturity. Stem more or less equal or is slightly enlarged downward. Initially solid, it becomes hollow from the bottom up as it matures. The membranous ring is located on the upper half of the stem near the cap, but may be sloughed off and missing in older specimens. Above the level of the ring, the stem surface has a very fine whitish powder and is paler than the cap; below the ring it is brown down to the reddish-brown to bistre base.

Similar species Galerina marginata may be mistaken for a few edible mushroom species like Pholiota mutabilis, Armillaria mellea and Kuehneromyces mutabilis.

Galerina marginata on the First Nature Web site.','lethally poisonous');
INSERT INTO mushroom(name_eng, name_latin, description, edibility) VALUES ('Pinkgill mushroom','Entoloma vernum','Cap 2-4 cm diameter, stem 2-7 cm tall * 0.2-0.6 cm thick. Entoloma vernum, also known as Pinkgill mushroom, is a small agaric that has grey-brown cap and stem, with brown gills. It can be seen mainly in spring, but also during summer and autumn, and occur as solitary or in small trooping groups in grasslands, often in the vicinity of conifers.

Cap grayish tan or darker, conic to broadly conic, flattening out somewhat but retaining a sharp, central umbo; dry; silky to nearly bald; Flesh brown, thin and fragile. Gills tan-brown or grayish, becoming pinkish, narrowly attached to the stem, or nearly free from it; close or nearly distant.Spores are pink colored. Stem equal, or slightly tapered toward the apex; finely fibrillose near the apex, but nearly bald elsewhere; brownish to tan or brown overall, but paler at the apex. Ring abcent. Flesh same color as surface, pithy or narrowly hollow.

Entoloma vernum on the First Nature Web site.','inedible');
INSERT INTO mushroom(name_eng, name_latin, description, edibility) VALUES ('Silky Pinkgill','Entoloma sericeum','Cap 2-4 cm diameter, stem 2-7 cm tall * 0.15-0.5 cm thick. Entoloma sericeum, also known as Silky Pinkgill, is a small agaric that has a dark brownish grey cap and stem, with pale gills. It grows solitary, or in small trooping groups on soul in grass and on open moorland.

Cap initially conical, developing an umbo as it becomes broadly convex; hygrophanous, darker brown when wet and much paler, often streaky buff when dry; surface smooth with silky radial fibrils. Flesh same color as cap or more pallid.  Gills sinuate; pale grey at first, becoming pinkish grey and eventually brown. Spores are pink. Stem same color as cap, more pallid at the apex and base, silky fibrillose, more or less equal, base slightly swollen. The mushroom has no ring.

Similar species There are several Entoloma species that are similar in appearance, such as Entoloma cetratum, which is warmer honey brown and Entoloma conferendum which has star-shaped spores.','inedible');
INSERT INTO mushroom(name_eng, name_latin, description, edibility) VALUES ('Earthy Powdercap','Cystoderma amianthinum','Cap 2-5 cm diameter, stem 3-5 cm tall * 0.4-0.8 cm thick. Cystoderma amianthinum, also known as Earthy Powdercap or Saffron parasol, is a small to medium, fleshy agaric with ochre-yellow cap, white or cream gills has a coarsely granular stem with ring. It grows solitary or scattered in small tufted groups in damp mossy grassland, in coniferous forest clearings, or on wooded heaths.

Cap  ochraceous or yellowish tan, convex to bell-shaped, and later flat with a slight depression around a low umbo (central boss). It is dry and powdery, often with a shaggy or fringed margin. Gills initially white, becoming creamy later. They are adnexed (narrowly attached to the stem), and initially quite crowded. Spore print is white.
Stem cylindrical, and has a flaky-granular sheath beneath a fleeting, powdery ring. Flesh dirty yellow, firm and stuffed.

Cystoderma amianthinum on the First Nature Web site.','inedible');
INSERT INTO mushroom(name_eng, name_latin, description, edibility) VALUES ('Trumpet Chantarelle','Craterellus tubaeformis','Cap 1.5-6 cm dia; stem 3-8 cm tall * 0.4-0.9 cm dia.. Craterellus tubaeformis (formerly Cantharellus tubaeformis) is an edible fungus, also known as Yellowfoot, winter mushroom, or Trumpet Chanterelle. It is small to medium-sized, funnel-shaped, dingy-brown cap has forked veins instead of gills and a yellowish stem. It grows on moss and found mostly in conifer bogs.

Cap dark grayish brown, convex and sometimes hollow down the middle. The forked veins are widely separated, and of lighter color than the cap. Stem tall, yellowish, somewhat flattened and hollow and often slightly club-shaped or bulbous at the base. Flesh thin and membranous.

Similar species Chrysomphalina chrysophylla, which has gills instead of veins.

Cantharellus tubaeformis on the First Nature Web site.

Craterellus tubaeformis on the MushroomExpert.Com Web site.','edible and good ');
INSERT INTO mushroom(name_eng, name_latin, description, edibility) VALUES ('Gassy webcap','Cortinarius traganus','Cap 5-8 cm diameter, stem 5-12 cm tall, 0.6-1.2 cm thick. Cortinarius traganus, also known as Gassy webcap, has a convex to umbonate, fleshy, silvery violet cap. It is mycorrhizal, usually with deciduous trees, but also found with conifers, often on acidic soil.

Cap initially spherical to convex, with the margin rolled inward, later flattened, sometimes with large, broad, central umbo. The margin often cracks star-like, particularly in dry weather. Color first pale azure violet to pale lilac color, later fading to tan brown or rusty brown. The surface is dry, silkily shiny or tomentose at the margin with membranaceous bronze fragments of the veil, it becomes later cracked into small scales. Gills sub-crowded, quite thick, broadly adnate, and often slightly emarginate. Color slightly dirty violet when young, later brown. Stem tough and thick, bulbously at the base, and spongily stuffed inside. It is vivid violet for a long time in the upper part above the cortina, paler below, and covered with a tough, whitish, boot-like veil, which usually leaves upright zones on the stem. The cortina is violet. The flesh is saffron yellowish-brown to yellowish-brown from the beginning except at the tip of the stem where it is dirty violaceous. It has a strong, bitter taste, particularly when young.

Similar species Cortinarius malachius has a slightly scaly cap. Cortinarius camphoratus is similar in appearance and is also violet, but it has pale violet gills which soon turn rusty, and a longer stem with paling flesh at the base. It is associated with conifers, as are Cortinarius alboviolaceus.

','inedible');
INSERT INTO mushroom(name_eng, name_latin, description, edibility) VALUES ('Poison Dye Cort','Cortinarius semisanguineus','Cap 2-6 cm diameter, stem 2-10 cm tall * 0.4-1 cm thick. Cortinarius semisanguineus, also know as Poison Dye Cort, is a medium-sized mushroom with a pale brown to ochre cap, and bright blood-red gills and yellowish stem. It grows typically with conifers and birch.

Cap olive- to dark reddish brown, convex to umbonate. Gills blood red, later more reddish rust and adnate, sinuate and fairly crowded. Spores are rusty brown. Stem usually same colour as the cap or paler, smooth, or finely fibrillose like the cap with threadlike remnants of veil. Stem flesh darker red-brown than cap flesh. The mushroom has no ring.

Cortinarius semisanguineus on the First Nature Web site.','poisonous');
INSERT INTO mushroom(name_eng, name_latin, description, edibility) VALUES ('Deadly Webcap','Cortinarius rubellus','Cap 3-8 cm diameter, stem 5-11 cm tall * 0.8-1.5 cm diameter. Cortinarius rubellus, commonly known as the Deadly Webcap, is a lethally poisonous mushroom which smells of radishes and is reddish orange with a pointed, umbonate cap covered with fibrils.

Cap conical to convex (partly flattening to umbonate with maturity). In colour, it is a tawny to date brown with paler margins, and is covered in fine, fibrous scales. The gills are ochre- or caramel-coloured, changing to a deeper brown with age as the spores mature. They have an adnate connection to the stipe.
The Stem has a bulbous base. It is the same colour or slightly paler than the cap, and can have yellow fragments of the veil (cortina) attached to its lower half. The flesh is cream or pale yellow, but more tan below the pileipellis and in the stem base. It smells slightly of radishes and has no strong taste.

Similar species Cortinarius limonius, also poisonous, has more vivid orange coloring. Cortinarius orellanus has a less conical cap and grows near decidous trees.','lethally poisonous');
INSERT INTO mushroom(name_eng, name_latin, description, edibility) VALUES ('Fool''s Webcap','Cortinarius orellanus','Cap 3-7 cm diameter, stem 3-8 cm tall * 0.5-1.3 cm diameter. Cortinarius orellanus, also know as Fool''s Webcap, is is a medium sized agaric with tawny brown, bluntu umbonate cap. The gills are colored as the stem. Grows solitary of in scattered trooping groups, with broad-leaf trees. The mushroom is lethally poisonous.

Cap bell-shaped, with a sharply inrolled margin at first, expanding to convex or flat, with a broad, low, rounded hump. Surface minutely fibrillose, tending to develop fine, depressed scales. Brownish orange to reddish orange. Margin thin, often flaring in age. Stem cylindrical, becoming hollow. Surface fibrillose; moderate yellow to moderate orange with zones of reddish.

Similar species Many in Cortinarius and related genera.','lethally poisonous');
INSERT INTO mushroom(name_eng, name_latin, description, edibility) VALUES ('Orange Webcap','Cortinarius mucosus','Cap 6-10 cm diameter, stem 6-10 cm tall * 1-2.5 cm thick. Cortinarius mucosus, also know as Orange Webcap, is a medium to large agaric whit a hat that is yellowish brown and very slimy. It has cinnamon or rust colored gills, a stout white stem with ring zone and slightly swollen base. It grows typically with pine or birch.

Cap coloured dark reddish to to orange brown, convex or wavy margined, smooth, very sticky. Gills gray to cinnamon brown, sinuate, adnate. Spores are rusty brown. Stem is white with rust sub-apical cortinal zone. It is smooth or faintly scaly below cap, more or less equal or slightly swollen at base, and very sticky. The mushroom has no ring.

Similar species Cortinarius collinitus occurs with spruce. It has a blue -tinged slime on its stem. Other similar species grow under different host trees.

Cortinarius mucosus on the First Nature Web site.','inedible');
INSERT INTO mushroom(name_eng, name_latin, description, edibility) VALUES ('IDKWTFISTHISSHITNIGGA                                      110','Cortinarius malicorius','Cap 1.5-5 cm diameter, stem 2-7 cm tall * 0.6-1.2 cm diameter. The young gills of this Cortinarius are orange, which helps to separate it from many similar species. Habitat in coniferous woods.

Cap hemispherical then broadly convex; brownish cinnamon, margin more yellow; fibrillose to minutely scaly. Gills Attached to the stem but sometimes pulling away from it in age; close; orange at first, becoming cinnamon to rusty.
Stem middle slightly swollen at the base, soon hollow; bright yellow often with reddish area near the base; corona yellow. Flesh yellow. Odor slight. Taste slight. ','inedible');
INSERT INTO mushroom(name_eng, name_latin, description, edibility) VALUES ('Woolly Webcap','Cortinarius laniger','Cap 3-8 cm diameter, stem 6-10 cm tall * 1-2 cm thick. Cortinarius laniger, also know as Woolly Webcap, is a medium sized agaric with dull, somewhat tomentose, reddish brown cap and rust -brown gills has pale brown, belted stem tinged lilac at the apex. It grows solitary or in scattered trooping groups on wet mossy soil in or near upland coniferous woods.
','inedible');
INSERT INTO mushroom(name_eng, name_latin, description, edibility) VALUES ('Saffron Webcap','Cortinarius croceus','Cap 1.5 - 3 cm diameter; stem 2.5 - 8.5 cm tall x 0.3-0.5 cm diameter. Cortinarius croceus, also know as Saffron Webcap, is a small agaric with tawny-brown cap, yellowish tawny gills and slender, yellowish stem with faint ring zone grows solitary or in scattered trooping groups on soil in coniferous woods.

Cap at first ochraceous-brown, becoming rust colored; finely felty convex, often slightly umbonate, finely fibrillose. Flesh chrome-yellow and fairly thin. Gills at first yellow, then tawny and rust at maturity, adnexed, fairly Crowded. Spores rust. Stem longitudinally fibrillose, cylindrical, solid, surface covered with yellow or yellow-brown veil remnants. Ring absent but with faint superior cortinal zone. Flesh chrome-yellow, fibrous, narrowly hollow, stuffed or full.

Cortinarius croceus on the First Nature Web site.

Cortinarius croceus on the MushroomExpert.Com Web site.','inedible');
INSERT INTO mushroom(name_eng, name_latin, description, edibility) VALUES ('IDKWTFISTHISSHITNIGGA                                      113','Cortinarius collinitus','Cap 6-10 cm diameter, stem 7-12 cm tall, 1-2.5 cm thick. A orange-brown cap, which is convex or has a wavy margin, and a sturdy white stem are good indicators of this species. Both the cap and the white stem are covered in the slimy remains of the veil which is blue-tinged. The mushroom occurs with spruce.

Cap convex to flat in shape, with a sticky, gelatinous surface (in moist conditions). Gills are adnexed, close, and pallid or pale violet in color. Stem solid, equal, and has transverse scaly-looking bands. The spore print, like most Cortiniarius species, is rusty-brown. Edibility is unknown for this species.

Similar species Cortinarius mucosus.','inedible');
INSERT INTO mushroom(name_eng, name_latin, description, edibility) VALUES ('Gypsy Mushroom','Cortinarius caperatus','Cap 5-12 cm diameter, stem 4-10 cm tall * 1-1.5 cm thick. Cortinarius caperatus, also known as Gypsy Mushroom, is egg-shaped on emerging and its cap becomes convex to umbonate with age. It is yellow-brown with a wrinkled surface and remnants of the white to lilac veil in the center. The smooth stem has a narrow, sheathing ring, also known as a partial veil, which is a key identifying feature of the mushroom.

Cap yellow-brown to brownish-ochre, which is covered with whitish fibres. The surface has a wrinkled and furrowed texture. It may have a lilac tinge when young. Initially convex before expanding and flattening with a boss (umbo) in the centre. Gills pallid buff or clay, adnate, crowded. Spores are pale brown. Stem slightly swollen at the base, and is whitish with a whitish ring, which is initially attached to the cap.

Similar species Cortinarius species are related, but have no true stem rings and have rust-brown spores.

Cortinarius caperatus on the www.first-nature.com web site.','edible and good ');
INSERT INTO mushroom(name_eng, name_latin, description, edibility) VALUES ('Red-banded Cort','Cortinarius armillatus','Cap 4-12 cm diameter, stem 6-12 cm tall * 1-3 cm thick. Cortinarius armillatus, commonly known as the Red-banded cortinarius, is a medium or large agaric that has a rust-brown, bell-shaped, fibrous cap, rust gills and reddish belts on stem with swollen base. It grows typically in moist coniferous forests, especially spruced ones.

Cap bell shaped at first, later flattening out, vividly rust-brown becoming slightly paler with age, with small fibrous scales, often with reddish cortinal remnants forming a belt at margin. Gills dark rust-brown; broad, distant and shallowly sinuate. Spores are rusty brown. Stem is a pallid cap color streaked with fibrils, more or less equal but markedly swollen at base. Ring is made of velar remnants forming one or more orange-red median or inferior ring zones. Flesh is light brown.

Cortinarius armillatus on the First Nature Web site.','inedible');
INSERT INTO mushroom(name_eng, name_latin, description, edibility) VALUES ('Silvery Violet Cort','Cortinarius alboviolaceus','Cap 5-8 cm diameter, stem 5-12 cm tall * 1-2 cm thick. Cortinarius alboviolaceus, also called Silvery violet cort, has a convex to umbonate, fleshy, silvery violet cap. It grows with deciduous trees, but also found with conifers, often on acidic soil.

Cap at first domed and then shallowly convex with a broad umbo, the dry, silky caps vary in colour from almost white through pale lilac to pale mauve. The rather broad, sinuate, notched gills are medium spaced and light gray-blue to cinnamon-brown. Stem The twisted, often club-shaped stem is often bowed rather than straight, is pale and fibrous with a slightly clavate (club-shaped) base and sometimes marked rust-brown around the veil zone by deposited spores.

Similar species Cortinarius malachius has a slightly scaly cap. It is associated with conifers, as are Cortinarius camphoratus and Cortinarius tranganus, which are noted for their penetrating smells; the former reminiscent of half-rotten potatoes, the latter sweet and sticky.

Cortinarius alboviolaceus on the First Nature Web site.','inedible');
INSERT INTO mushroom(name_eng, name_latin, description, edibility) VALUES ('Umbrella Inky Cap','Coprinus plicatilis','Cap 0.8–2 cm; stem 4-8 cm tall * 1-2 mm diameter. Parasola plicatilis, also known as Parasola plicatilis or Umbrella inky cap is a small parasol-like agaric that can be found in grassy areas, alone, scattered or in small groups. The fruiting bodies grow at night after rain, and will self decompose after spore dispersion is achieved.

Cap buff, more cinnamon at the centre and later with gray tinge at the margin. The shape is ovoid at first, becoming convex or bell-shaped, then flat and finally shallowly convex like a parasol. Gills pallid clay,  soon grey and finally black; free from the stem; close or nearly distant. Stem white or buff, equal above a slightly swollen base; fragile; hollow; bald or very finely silky. The mushroom has no ring.

Similar species Coprinus auricomus tends to be a bit bigger and has browner cap. A microscope reveals thick-walled brown hairs, confirming it''s identity. Other similar species include Coprinus keuhneri, Coprinus leiocephalus and Coprinus nudiceps. They can be distinguished only by carefully measuring the spores.

Parasola plicatilis on the First Nature Web site.','inedible');
INSERT INTO mushroom(name_eng, name_latin, description, edibility) VALUES ('Shaggy-mane Inky Cap','Coprinus comatus','Cap 5-15 cm tall * variable diameter, stem 10-30 cm tall * 1.5-2.5 cm thick. Coprinus comatus, also known as shaggy-mane ink cap, or lawyer''s wig is a common fungus which has a white, conical, shaggy cap which blackens. It grows in scattered trooping groups on soil in short grass.

Cap almost cylindrical  and initially covers most of its stem, becomes later conical. It is mostly white with shaggy scales, which are more pale brown at the apex. Gills free, colour change rapidly from white to pink, then to black. It is deliquescent. Spores are black. Stem is white, smooth, often very tall, slightly swollen at base and sometimes rooting. It has a loose ring which is white, thin and often slipping down stem towards base. The flesh is white, hollow and fragile and the taste mild.

Coprinus comatus on the First Nature Web site.','edible and good ');
INSERT INTO mushroom(name_eng, name_latin, description, edibility) VALUES ('Common Ink Cap','Coprinopsis atramentaria','Cap 3-7 cm tall * variable diameter, stem 7-14 cm tall * 1-1.5 cm thick. Coprinopsis atramentaria, commonly known as the common ink cap, inky cap or alcohol inky cap, is poisonous, when combined with alcohol. It is a medium-sized conical agaric, that is greyish brownish and later blackening. It grows generally in tufts, in fields, gardens and waste ground, near broad-leaf tree stumps or buried wood.

Cap egg-shaped, expanding to become slightly umbonate with age. The colour is gray to gray-brown. Flesh is white, hollow and medium in young specimens but soon discolors and deliqueces slowly from the margin. Gills free, extremely crowded and edged with white. Spores are black. Stem is white and smooth with fine, reddish brown fibrils at base.

Similar species Coprinus insignis has warty spores. Coprinus micaeus is smaller and more fragile. It granulates when young.

Coprinopsis atramentaria on the First Nature Web site.','poisonous');
INSERT INTO mushroom(name_eng, name_latin, description, edibility) VALUES ('Tiger''s Eye','Coltricia perennis','Cap 2-8 cm diameter, stem 0.2-1 cm thick * 1.3-3.5 cm tall. Coltricia perennis, also known as Tiger''s Eye, is an annual polypore that is very unusual in that it grows in the soil rather than on dead wood. It prefers humus-rich sandy soil on woodland edges and on acidic heathland.

Fruiting body upper surface zoned concentrically in shades of ochre, grey and rust with maroon tinge, disc-like, at first finely downy, becoming smooth with age; stem rusty-brown, downy, more or less central. Flesh brown, thin, corky, harder when dry.

Similar species Several tooth-fungi are similar above but have spiny undersides.
','inedible');
INSERT INTO mushroom(name_eng, name_latin, description, edibility) VALUES ('Russet Toughshank','Collybia dryophila','Cap 2-6 cm diameter, stem 2-6 cm tall * 0.2-0.5 cm diameter. Collybia dryophila, also known as Gymnopus dryophilus, is a smallish agaric has a pale tan cap, whitish gills, and a flushed tan stem. The mushroom occurs in troops or more or less tufted on soil and scattered leaves under leafy and coniferous trees.

Cap convex, and russet to ochre. Gills only thinly attached to the stem, whitish and crowded. Spores are white. Stem more or less similarly colored as the cap, more or less equal but slightly bulbous at base. The mushroom has no ring.

Similar species Collybia aquosa has pale pink rhizoids and Collybia ocior has a rather dark cap and pale yellow gills.

Synonyms the mushroom is now known under the name Gymnopus dryophilus.

Gymnopus dryophilus (Collybia dryophila) on the www.first-nature.com web site.
','inedible');
INSERT INTO mushroom(name_eng, name_latin, description, edibility) VALUES ('Dread Dough Clitopilus','Clitopilus prunulus','2-3 cm diameter * 2-3 cm tall. A pale gray-white cap and decurrent, pale pink gills, combined with a strong smell of fresh bread dough, distinguish this species.

Cap white or light gray or yellow, convex to funnel-shaped that may have inrolled margin, sticky when moist. Gills decurrent, spaced together rather closely, and whitish, although they often develop a pinkish hue in age. Stem is central or off-center and is similar in color to the cap.

Similar species Species of Clitocybe and Entoloma can look very similar and are poisonous.

Clitopilus prunulus on the First Nature Web site.','edible ');
INSERT INTO mushroom(name_eng, name_latin, description, edibility) VALUES ('Clouded Funnel Cap','Clitocybe nebularis','Cap 8-20 cm diameter, stem 5-10 cm tall * 1.4-4 cm diameter. Clitocybe nebularis or Lepista nebularis, commonly known as the clouded agaric or cloud funnel cap, has convex to flattened or slightly depressed, cloud-grey cap and white, decurrent gills. It grows typically in troops or rings on soil in  broad leaf or coniferous woods.

Cap soft cloud-grey, darker at the middle, sometimes with brownish ting. It is convex with an incurved margin, becoming plane to depressed in shape. The surface is usually dry to moist, and radially fibrillose. Gills crowded, pale cream and slightly decurrent. Stem colored as cap, fibrillose, stout, tapering upwards. The mushroom has no ring. Flesh thick and white.

Clitocybe nebularis on the www.first-nature.com web site.
','inedible');
INSERT INTO mushroom(name_eng, name_latin, description, edibility) VALUES ('Common Funnel Cap','Clitocybe gibba','Cap 3-8 cm diameter, stem 3-8 cm tall * 0.5-1 cm thick. Clitocybe gibba is a hardwood-loving mushroom that features a pinkish tan cap that becomes fairly deeply vase-shaped by maturity. Its pale, crowded gills run down the stem, which is pale in comparison to the cap. It grows solitary or in small troops on soil in broad-leaf woods and on heaths from July to September.

Cap is pink-tinged, leather brown and smooth, silky, and funnel-shaped, typically with a wavy margin. Flesh is soft and white with a fruity smell. Gills are closely spaced, white and deeply extended downward. Stem is similarly colored as the cap. It is smooth and more or less equal apart from a slightly swollen base. The mushroom has no ring.Spores are white-cream colorcolored.

Clitocybe gibba on the www.first-nature.com web site.','inedible');
INSERT INTO mushroom(name_eng, name_latin, description, edibility) VALUES ('Club-footed Clitocybe','Clitocybe clavipes','Cap 4-8 cm diameter, stem 3-7 cm tall * 1-1.5 cm thick. Clitocybe clavipes, commonly known as the club-foot or club-footed clitocybe is identified by it''s club-shaped stem, which is swollen at the base and tapering toward the top and funnel-shaped cap with white girls that extend downward. It grows solitary or in small troops on soil in broad-leaf woods, favorfavoring beech.

Cap convex with a small boss, becoming plane to depressed in shape. It has a smooth surface. Cap colours are generally grey-brown, sometimes tinged olive, with a pale margin. Gills are strongly decurrent and cream-yellow in colour, contrasting with the rest of the mushroom. There are some smaller gills in between the regular gills, and the gills are occasionally forked near the stem. The gill edges are straight in younger mushrooms and sometimes wavy (undulate) in older ones. Flesh white, but slightly yellow at the base. Stem bulbous base, its surface is covered in silky fibres, and it is the same colour as the cap.

Synonyms the newer name for Clitocybe clavipes is Ampulloclitocybe clavipes.

Ampulloclitocybe clavipes (Clitocybe clavipes) on the www.first-nature.com web site.','inedible');
INSERT INTO mushroom(name_eng, name_latin, description, edibility) VALUES ('Peppery Bolete','Chalciporus piperatus','Cap 3-5 cm diameter, stem 4-6 cm tall * 0.3-1 cm thick. Chalciporus piperatus, also know as Peppery Bolete, is a very small bolete that is cinnamon-brown throughout, except for the chrome-yellow stem flesh; it does not stain blue on bruising. The slightly greasy cap is convex in shape, and the stem is slender; the tubes are 0.3-1 cm long. The flesh has an intensely hot and peppery flavor, making this species inedible, although is has been used as spice.

Cap initially convex before flattening out in age, tubes are adnate to decurrent. Pores are angular cinnamon to rust brown. Spores are susty brown.

Similar species Chalciporus piparatoides it similar but can be distinguished by the blue bruising of its cap, tubes, and pores. Chalciporus amarellus has pinker coloring and a less peppery taste.

Chalciporus piperatus on the MushroomExpert.Com Web site.
','inedible');
INSERT INTO mushroom(name_eng, name_latin, description, edibility) VALUES ('Common Chantarelle','Cantharellus cibarius','Cap 3-10 cm across, stem 2-10 cm tall * 0.4-1.5 cm thick. This mushroom is typically orange or yellow, meaty and funnel-shaped. On the lower surface, underneath the smooth cap, it has gill-like ridges that run almost all the way down its stem, which tapers down seamlessly from the cap.

Cap light yellow, bright yellow to orange in colour, fading with age. As young formed as a button and then turns more cone shaped. The margin stays folded in for a long time and then often becomes wavy and uneven at maturity. The mushroom has gill-like veins under the cap, not gills. Flesh firm, thick, yellow. Stem solid, tapers downward from cap. The surface is smooth and the colour similar to the cap or a lighter yellow to almost white.

Similar spiecies Hygrophoropsis aurantiaca which is not mycorrhizal. Can also be confused with the poisonous mushrooms Omphalotus olearius, which has a luminous quality and grows on dead wood, and Cortinarius speciosissimus.

Cantharellus cibarius on the First Nature Web site.
','edible and excellent ');
INSERT INTO mushroom(name_eng, name_latin, description, edibility) VALUES ('Grayling','Cantharellula umbonata','cap 2-3 cm dia; stem 2.5-12.5 cm tall * 0.3-0.7 cm dia.. This is a small to medium-sized, funnel-shaped agaric with grey cap and forked gills grows associated with Polytrichum moss and fruits in the summer and fall.

Cap convex at first, becoming flat to sunken; most specimens with a small, pointed umbo; margin incurved at first, becoming upturned and wavy in age; surface gray to grayish brown overall, often appearing to have whitish blotches; dry to moist; smooth to minutely hairy; flesh white; odor and taste not distinctive. Gills close to crowded, decurrent, repeatedly and regularly forked; whitish, developing spot-like reddish or sometimes yellow stains in age. Stem often with swollen portions; some-what flexible, often bent, curved, and/or twisted; white to gray; silky above, stuffed, usually with whitish mycelium binding the lower stalk to mass; often water-saturated near the base. Spore print white.','edible ');
INSERT INTO mushroom(name_eng, name_latin, description, edibility) VALUES ('Pink Lawn Trich','Calocybe persicolor','Cap 3-5 cm diameter, stem 3-5 cm tall * 0.3-0.8 cm diameter. Calocybe persicolor is a small pink-capped mushroom with white gills that can be found in grassy meadows, fields, or on lawns from spring to autumn. It is less frequently found in open grasslands.

Cap convex to umbonate, smooth fleshy and pink coloured. It has a somewhat irregular margin and is covered with whitish dust or bloom.  The flesh is white with pink tinge beneath cuticle. Gills are white, crowded, sinuate and notched. Stem pallid similarly colored as the cap. Smooth, fleshy, tapers slightly upwards.','inedible');
INSERT INTO mushroom(name_eng, name_latin, description, edibility) VALUES ('St George''s Mushroom','Calocybe gambosa','Cap 5-15 cm diameter; stem 3-7 cm tall x 2-3 cm diameter. Calocybe gambosa, commonly known as St. George''s mushroom, is an edible, medium to large, fleshy, cream mushroom which typically grows in rings or troops on soil. It is most commonly found in pastures but also less frequently appearing in mixed woods.

Cap white-creamy coloured to bright yellow, often with brownish tinge. At first sub-spherical, becoming expanded and irregularly convex with an incurved margin. Gills sinuate, white and crowded. The flesh is thick and soft and has a mealy or cucumber smell. The spore print is white to pinkish white.  Stem whitish, smooth, bulky at the base. The mushroom has no ring.

Similar species Spring fruiting white Entoloma species are distinguished by pink spore deposits and pink mature gills.','edible ');
INSERT INTO mushroom(name_eng, name_latin, description, edibility) VALUES ('Yellow Stagshorn','Calocera viscosa','3-10 cm tall. This is a yellow, antler-like, gelatinous fungus which grows in tufts or stumps and roots of coniferous trees. It fruits throughout the year, but is most commonly seen in autumn.

Fruiting body bright orange, yellow or occasionally white branching basidiocarps, which are somewhat gelatinous and somewhat slimy when wet. Branches are sometimes flattened and sometimes forked at tips.

Similar species Calocera cornea has small, unbrached clubs and grows on deciduous twigs. Calocera furcata is forked and grows on pine wood. Paler Calocera pallidospathulata is flattened and irregular. Gymnospoarngium clavariiforme, found on juniper, is less erect and without branches at the tips.','inedible');
INSERT INTO mushroom(name_eng, name_latin, description, edibility) VALUES ('Paltry Puffball','Bovista plumbea','2-3 cm diameter * 2-3 cm tall. This small, white, puffball, often referred to as the paltry puffball, is attached to the stony surface by several strands. It often live scattered to clustered in disturbed areas, especially in sparse grass and pastures.

Fruiting body attached to the substrate by a tuft of mycelium, and spherical to slightly compressed. The surface is white, becoming buff to pale-tan and minutely tomentose. It is falling away in flakes at maturity to reveal dark grey papery contents. Spores are olive to sepia-brown.

Bovista plumbea on the www.first-nature.com web site.','edible ');
INSERT INTO mushroom(name_eng, name_latin, description, edibility) VALUES ('Berkeley''s polypore','Bondarzewia berkeleyi','Fruiting Body 25-40 cm across. Bondarzewia berkeleyi, commonly known as Berkeley''s polypore, or stump blossoms, is a species of polypore fungus in the family Russulaceae. It is a parasitic species that causes butt rot in oaks and other hardwood trees. Although Bondarzewia berkeleyi is edible, it has been compared to eating shoe leather.

Fruiting body The fan- or shelf-shaped caps grow in overlapping clumps from the bases of oak trees, each capable of growing to 25.5 cm diameter. They are various shades of white to pale grey, cream, beige or yellow. The pore surface is white, as is the spore print. The outer edges that cut easily with a knife are quite tender.','edible ');
INSERT INTO mushroom(name_eng, name_latin, description, edibility) VALUES ('Yellow-cracking Bolete','Boletus subtomentosus','Cap 5-12 cm diameter, stem 3-8 cm tall * 1-2 cm diameter. This medium to large bolete is commonly known as suede bolete or yellow-cracked bolete. It has a brown cap, chrome-yellow pores, and yellowish stem and grows with a wide range of hardwood and conifer trees.

Cap pale olive or tan, initially convex before flattening with a velvety tan surface, often becoming cracked in age. Flesh is white or pallid yellow, with a faint brownish zone beneath the cap cuticle; it is unchanging, thick and soft. The pore surface is yellow, becoming olive yellow with maturity and bruise blue or green before fading somewhat. Stem is a pallid cap color, sometimes with a brick-red tinge; it is slender and slightly bulbous. The mushroom has no ring. Flesh is similarly colored as the cap but browner.

Similar species Boletus chrysenteron has a reddish brown cap that cracks to reveal a red underlayer. Boletus pruinatus is smaller.

Boletus subtomentosus on the www.first-nature.com web site.','edible ');
INSERT INTO mushroom(name_eng, name_latin, description, edibility) VALUES ('Satan''s Bolete','Boletus satanas','Cap 8-25 cm diameter, stem 6-9 cm tall * 5-10 cm diameter. This lethally poisonous fleshy bolete has a smooth, bun-shaped cap that is almost white. Boletus satanas is best identified by its orange to blood-red pores and prominent yellow to blood-red net pattern. It also has a fat, yellow to red stem.

Cap compact, at first it is hemispheric with an inrolled margin, later flattening in the shape of a pad, and in older specimens it is bent irregularly. The pileus at first greyish white, later more greenish ochre or leather colour. The surface of the cap is finely tomentose, later smooth and often slightly sticky in wet weather. Pores are small, circular and red, sometimes blood-red, but orange at margin. The free to slightly adnate tubes are yellow then olive, blue where cut. Stem yellow background covered with a hexagonal close-meshed net that starts bright red and turns dark blood-red. Often very bulbous and usually wider than it is long. When young almost spherical.
','lethally poisonous');
INSERT INTO mushroom(name_eng, name_latin, description, edibility) VALUES ('Pinewood King Bolete','Boletus pinophilus','Cap 6–15(20) cm; stem 5-15 cm tall * 4-7 cm diameter. This is a large bolete with dark brown cap, cream pores, reddish brown netted, bulbous stem, commonly known as the pine bolete or pinewood king bolete. It grows solitary or scattered on soil particularly with Scots pine in Britain. The mushroom prefers the poor, acidic, and sandy soils associated with coniferous forests.

Cap deep red-brown or copper coloured. Stays convex for a while, but eventually flattens out. Often irregular in shape when mature. The surface is hard, dimpled and rough and sticky when damp. The flesh is white, tinged cap color beneath the cuticle, unchanging, thick, fairly firm. Pores white then cream colored, becoming olivaceous-brown with age, circular and small. Spores pallid olivaceous-yellow colored. Stem thick and egg pr pear shaped when young. The network pattern is dark brown at the bottom and gets lighter towards the cap. Flesh white, unchanging and fairly firm. The mushroom has no ring.

Similar species The closely related Boletus edulis has brown color and grows with Pine. Tylopilus felleus is similar when young but tastes bitter and is thus inedible.','edible and excellent ');
INSERT INTO mushroom(name_eng, name_latin, description, edibility) VALUES ('King Bolete','Boletus edulis','Cap 8–20(30) cm; stem 6-8 cm tall * 2-4 cm diameter. This is a large, robust bolete with dull brown cap, dirty white pores and stout and swollen stem. It has a white net over upper stem. It is a very popular, delicious, meaty mushroom that grows almost all over the world.

Cap convex in shape when young and flattens with age, color is quite variable from light brown to reddish brown. Flesh white, unchanged when cut or bruised. The pore layer is quite hard when young and white changing to yellowish then to pea soup green to greenish brown becoming fairly soft at maturity. Tubes white at first, slowly becoming greyish yellow to olive-brown. Stem Very thick and club shaped and usually finely reticulated meaning it has a net shaped raised pattern on the surface. The reticulation is most pronounced near the top. The color can vary from whitish cream to reddish brown. It can become cylindrical at maturity. Ring absent. Interior solid.

Similar species Boletus variipes has a dry, tan cap and grows with oak; Tylopilus felleus is similar when young but tastes bitter and is thus inedible.

Boletus edulis on the First Nature Web site.','edible and excellent ');
INSERT INTO mushroom(name_eng, name_latin, description, edibility) VALUES ('Bay Bolete','Boletus badius','Cap 4-14 cm diameter, stem 4-12 cm tall * 1-4 cm diameter. This is a large bolete with bay-brown cap and lemon-yellow pores bruises distinctively bluish green. It grows in coniferous or mixed woods on the ground or on decaying tree stumps.

Cap chestnut to dark brown, sometimes with brick-red or ochre tinges; almost spherical in young specimens before broadening and flattening out. It is at first downy, becoming smooth and polished, somewhat sticky when damp. Flesh is white or lemon-yellow. Where cut, it becomes faintly blue. Pores are initially cream to pale yellow, but become greenish yellow or olive with age. Stem  is similar in colour to the cap but paler, and sometimes with a rose-coloured tinge and relatively slim and cylindrical (compared to  many other boletes). The mushroom has no ring.

Similar species Boletus edulis has a barrel-shaped stem with white net patterning.

Synonyms Synonyms of Boletus badius include Imleria badia, Ixocomus badius and Xerocomus badius.

Imleria badia on the First Nature Web site.','edible and good ');



















/* *********************** mushroom_image *************************** */
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(1,'http://www.mushroom.world/data/fungi/Agaricusarvensis1.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(1,'http://www.mushroom.world/data/fungi/Agaricusarvensis2.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(1,'http://www.mushroom.world/data/fungi/Agaricusarvensis3.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(1,'http://www.mushroom.world/data/fungi/Agaricusarvensis4.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(1,'http://www.mushroom.world/data/fungi/Agaricusarvensis5.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(2,'http://www.mushroom.world/data/fungi/Amanitapantherina1.jpg');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(2,'http://www.mushroom.world/data/fungi/Amanitapantherina2.jpg');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(2,'http://www.mushroom.world/data/fungi/Amanitapantherina3.jpg');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(3,'http://www.mushroom.world/data/fungi/Amanitamuscaria1.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(3,'http://www.mushroom.world/data/fungi/Amanitamuscaria2.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(3,'http://www.mushroom.world/data/fungi/Amanitamuscaria3.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(3,'http://www.mushroom.world/data/fungi/Amanitamuscaria4.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(3,'http://www.mushroom.world/data/fungi/Amanitamuscaria5.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(3,'http://www.mushroom.world/data/fungi/Amanitamuscaria6.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(4,'http://www.mushroom.world/data/fungi/Amanitafulva1.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(4,'http://www.mushroom.world/data/fungi/Amanitafulva2.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(4,'http://www.mushroom.world/data/fungi/Amanitafulva3.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(4,'http://www.mushroom.world/data/fungi/Amanitafulva4.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(4,'http://www.mushroom.world/data/fungi/Amanitafulva5.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(4,'http://www.mushroom.world/data/fungi/Amanitafulva6.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(5,'http://www.mushroom.world/data/fungi/Amanitaceciliae1.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(5,'http://www.mushroom.world/data/fungi/Amanitaceciliae2.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(5,'http://www.mushroom.world/data/fungi/Amanitaceciliae3.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(5,'http://www.mushroom.world/data/fungi/Amanitaceciliae4.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(6,'http://www.mushroom.world/data/fungi/Albatrellusovinus1.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(6,'http://www.mushroom.world/data/fungi/Albatrellusovinus2.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(6,'http://www.mushroom.world/data/fungi/Albatrellusovinus3.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(6,'http://www.mushroom.world/data/fungi/Albatrellusovinus4.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(6,'http://www.mushroom.world/data/fungi/Albatrellusovinus5.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(7,'http://www.mushroom.world/data/fungi/Albatrellusconfluens1.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(7,'http://www.mushroom.world/data/fungi/Albatrellusconfluens2.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(7,'http://www.mushroom.world/data/fungi/Albatrellusconfluens3.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(8,'http://www.mushroom.world/data/fungi/Agaricusaugustus1.jpg');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(8,'http://www.mushroom.world/data/fungi/Agaricusaugustus2.jpg');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(8,'http://www.mushroom.world/data/fungi/Agaricusaugustus3.jpg');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(8,'http://www.mushroom.world/data/fungi/Agaricusaugustus4.jpg');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(9,'http://www.mushroom.world/data/fungi/Bankerafuligineoalba1.jpg');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(10,'http://www.mushroom.world/data/fungi/Auriscalpiumvulgare1.jpg');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(10,'http://www.mushroom.world/data/fungi/Auriscalpiumvulgare2.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(11,'http://www.mushroom.world/data/fungi/Armillariamellea1.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(11,'http://www.mushroom.world/data/fungi/Armillariamellea2.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(11,'http://www.mushroom.world/data/fungi/Armillariamellea3.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(11,'http://www.mushroom.world/data/fungi/Armillariamellea4.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(11,'http://www.mushroom.world/data/fungi/Armillariamellea5.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(11,'http://www.mushroom.world/data/fungi/Armillariamellea6.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(12,'http://www.mushroom.world/data/fungi/Amanitavirosa1.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(12,'http://www.mushroom.world/data/fungi/Amanitavirosa2.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(12,'http://www.mushroom.world/data/fungi/Amanitavirosa3.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(12,'http://www.mushroom.world/data/fungi/Amanitavirosa4.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(13,'http://www.mushroom.world/data/fungi/Amanitarubescens1.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(13,'http://www.mushroom.world/data/fungi/Amanitarubescens2.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(13,'http://www.mushroom.world/data/fungi/Amanitarubescens3.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(13,'http://www.mushroom.world/data/fungi/Amanitarubescens4.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(13,'http://www.mushroom.world/data/fungi/Amanitarubescens5.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(14,'http://www.mushroom.world/data/fungi/Amanitaregalis1.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(14,'http://www.mushroom.world/data/fungi/Amanitaregalis2.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(14,'http://www.mushroom.world/data/fungi/Amanitaregalis3.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(14,'http://www.mushroom.world/data/fungi/Amanitaregalis4.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(14,'http://www.mushroom.world/data/fungi/Amanitaregalis5.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(15,'http://www.mushroom.world/data/fungi/Amanitaporphyria1.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(15,'http://www.mushroom.world/data/fungi/Amanitaporphyria2.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(15,'http://www.mushroom.world/data/fungi/Amanitaporphyria3.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(15,'http://www.mushroom.world/data/fungi/Amanitaporphyria4.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(15,'http://www.mushroom.world/data/fungi/Amanitaporphyria5.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(16,'http://www.mushroom.world/data/fungi/Amanitaphalloides1.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(16,'http://www.mushroom.world/data/fungi/Amanitaphalloides2.jpg');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(16,'http://www.mushroom.world/data/fungi/Amanitaphalloides3.jpg');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(16,'http://www.mushroom.world/data/fungi/Amanitaphalloides4.jpg');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(16,'http://www.mushroom.world/data/fungi/Amanitaphalloides5.jpg');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(17,'http://www.mushroom.world/data/fungi/Tylopilusfelleus1.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(17,'http://www.mushroom.world/data/fungi/Tylopilusfelleus2.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(17,'http://www.mushroom.world/data/fungi/Tylopilusfelleus3.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(17,'http://www.mushroom.world/data/fungi/Tylopilusfelleus4.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(17,'http://www.mushroom.world/data/fungi/Tylopilusfelleus5.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(17,'http://www.mushroom.world/data/fungi/Tylopilusfelleus6.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(17,'http://www.mushroom.world/data/fungi/Tylopilusfelleus7.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(18,'http://www.mushroom.world/data/fungi/Turbinellusfloccosus1.jpg');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(18,'http://www.mushroom.world/data/fungi/Turbinellusfloccosus2.jpg');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(19,'http://www.mushroom.world/data/fungi/Tricholomopsisrutilans1.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(19,'http://www.mushroom.world/data/fungi/Tricholomopsisrutilans2.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(19,'http://www.mushroom.world/data/fungi/Tricholomopsisrutilans3.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(19,'http://www.mushroom.world/data/fungi/Tricholomopsisrutilans4.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(19,'http://www.mushroom.world/data/fungi/Tricholomopsisrutilans5.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(20,'http://www.mushroom.world/data/fungi/Tricholomopsisdecora1.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(20,'http://www.mushroom.world/data/fungi/Tricholomopsisdecora2.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(20,'http://www.mushroom.world/data/fungi/Tricholomopsisdecora3.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(20,'http://www.mushroom.world/data/fungi/Tricholomopsisdecora4.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(21,'http://www.mushroom.world/data/fungi/Tricholomasejunctum1.jpg');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(21,'http://www.mushroom.world/data/fungi/Tricholomasejunctum2.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(21,'http://www.mushroom.world/data/fungi/Tricholomasejunctum3.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(21,'http://www.mushroom.world/data/fungi/Tricholomasejunctum4.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(22,'http://www.mushroom.world/data/fungi/Tricholomasaponaceum1.jpg');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(22,'http://www.mushroom.world/data/fungi/Tricholomasaponaceum2.jpg');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(23,'http://www.mushroom.world/data/fungi/Tricholomafocale1.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(23,'http://www.mushroom.world/data/fungi/Tricholomafocale2.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(23,'http://www.mushroom.world/data/fungi/Tricholomafocale3.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(23,'http://www.mushroom.world/data/fungi/Tricholomafocale4.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(23,'http://www.mushroom.world/data/fungi/Tricholomafocale5.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(24,'http://www.mushroom.world/data/fungi/Tricholomaflavovirens1.jpg');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(24,'http://www.mushroom.world/data/fungi/Tricholomaflavovirens2.jpg');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(25,'http://www.mushroom.world/data/fungi/Suillusvariegatus1.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(25,'http://www.mushroom.world/data/fungi/Suillusvariegatus2.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(25,'http://www.mushroom.world/data/fungi/Suillusvariegatus3.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(25,'http://www.mushroom.world/data/fungi/Suillusvariegatus4.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(25,'http://www.mushroom.world/data/fungi/Suillusvariegatus5.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(26,'http://www.mushroom.world/data/fungi/Suillusluteus1.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(26,'http://www.mushroom.world/data/fungi/Suillusluteus2.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(26,'http://www.mushroom.world/data/fungi/Suillusluteus3.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(26,'http://www.mushroom.world/data/fungi/Suillusluteus4.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(26,'http://www.mushroom.world/data/fungi/Suillusluteus5.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(27,'http://www.mushroom.world/data/fungi/Suillusgrevillei1.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(27,'http://www.mushroom.world/data/fungi/Suillusgrevillei2.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(27,'http://www.mushroom.world/data/fungi/Suillusgrevillei3.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(27,'http://www.mushroom.world/data/fungi/Suillusgrevillei4.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(27,'http://www.mushroom.world/data/fungi/Suillusgrevillei5.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(27,'http://www.mushroom.world/data/fungi/Suillusgrevillei6.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(27,'http://www.mushroom.world/data/fungi/Suillusgrevillei7.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(28,'http://www.mushroom.world/data/fungi/Suillusbovinus1.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(28,'http://www.mushroom.world/data/fungi/Suillusbovinus2.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(28,'http://www.mushroom.world/data/fungi/Suillusbovinus3.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(28,'http://www.mushroom.world/data/fungi/Suillusbovinus4.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(28,'http://www.mushroom.world/data/fungi/Suillusbovinus5.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(29,'http://www.mushroom.world/data/fungi/Strophariahornemannii1.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(29,'http://www.mushroom.world/data/fungi/Strophariahornemannii2.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(29,'http://www.mushroom.world/data/fungi/Strophariahornemannii3.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(29,'http://www.mushroom.world/data/fungi/Strophariahornemannii4.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(29,'http://www.mushroom.world/data/fungi/Strophariahornemannii5.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(29,'http://www.mushroom.world/data/fungi/Strophariahornemannii6.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(30,'http://www.mushroom.world/data/fungi/Strobilurusstephanocystis1.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(30,'http://www.mushroom.world/data/fungi/Strobilurusstephanocystis2.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(30,'http://www.mushroom.world/data/fungi/Strobilurusstephanocystis3.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(31,'http://www.mushroom.world/data/fungi/Strobilurusesculentus1.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(31,'http://www.mushroom.world/data/fungi/Strobilurusesculentus2.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(31,'http://www.mushroom.world/data/fungi/Strobilurusesculentus3.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(32,'http://www.mushroom.world/data/fungi/Sarcodonsquamosus1.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(32,'http://www.mushroom.world/data/fungi/Sarcodonsquamosus2.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(32,'http://www.mushroom.world/data/fungi/Sarcodonsquamosus3.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(32,'http://www.mushroom.world/data/fungi/Sarcodonsquamosus4.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(32,'http://www.mushroom.world/data/fungi/Sarcodonsquamosus5.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(33,'http://www.mushroom.world/data/fungi/Russulaxerampelina1.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(33,'http://www.mushroom.world/data/fungi/Russulaxerampelina2.jpg');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(34,'http://www.mushroom.world/data/fungi/Russulapaludosa1.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(34,'http://www.mushroom.world/data/fungi/Russulapaludosa2.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(34,'http://www.mushroom.world/data/fungi/Russulapaludosa3.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(34,'http://www.mushroom.world/data/fungi/Russulapaludosa4.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(34,'http://www.mushroom.world/data/fungi/Russulapaludosa5.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(34,'http://www.mushroom.world/data/fungi/Russulapaludosa6.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(35,'http://www.mushroom.world/data/fungi/Russulaobscura1.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(35,'http://www.mushroom.world/data/fungi/Russulaobscura2.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(35,'http://www.mushroom.world/data/fungi/Russulaobscura3.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(35,'http://www.mushroom.world/data/fungi/Russulaobscura4.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(35,'http://www.mushroom.world/data/fungi/Russulaobscura5.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(36,'http://www.mushroom.world/data/fungi/Russulaemetica1.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(36,'http://www.mushroom.world/data/fungi/Russulaemetica2.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(36,'http://www.mushroom.world/data/fungi/Russulaemetica3.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(36,'http://www.mushroom.world/data/fungi/Russulaemetica4.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(36,'http://www.mushroom.world/data/fungi/Russulaemetica5.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(36,'http://www.mushroom.world/data/fungi/Russulaemetica6.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(37,'http://www.mushroom.world/data/fungi/Russuladecolorans1.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(37,'http://www.mushroom.world/data/fungi/Russuladecolorans2.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(37,'http://www.mushroom.world/data/fungi/Russuladecolorans3.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(37,'http://www.mushroom.world/data/fungi/Russuladecolorans4.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(37,'http://www.mushroom.world/data/fungi/Russuladecolorans5.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(38,'http://www.mushroom.world/data/fungi/Russulaclaroflava1.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(38,'http://www.mushroom.world/data/fungi/Russulaclaroflava2.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(38,'http://www.mushroom.world/data/fungi/Russulaclaroflava3.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(38,'http://www.mushroom.world/data/fungi/Russulaclaroflava4.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(38,'http://www.mushroom.world/data/fungi/Russulaclaroflava5.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(38,'http://www.mushroom.world/data/fungi/Russulaclaroflava6.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(39,'http://www.mushroom.world/data/fungi/Russulaaeruginea1.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(39,'http://www.mushroom.world/data/fungi/Russulaaeruginea2.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(39,'http://www.mushroom.world/data/fungi/Russulaaeruginea3.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(39,'http://www.mushroom.world/data/fungi/Russulaaeruginea4.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(40,'http://www.mushroom.world/data/fungi/Russulaacrifolia1.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(40,'http://www.mushroom.world/data/fungi/Russulaacrifolia2.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(41,'http://www.mushroom.world/data/fungi/Rickenellaswartzii1.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(41,'http://www.mushroom.world/data/fungi/Rickenellaswartzii2.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(41,'http://www.mushroom.world/data/fungi/Rickenellaswartzii3.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(41,'http://www.mushroom.world/data/fungi/Rickenellaswartzii4.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(42,'http://www.mushroom.world/data/fungi/Rhizinaundulata1.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(42,'http://www.mushroom.world/data/fungi/Rhizinaundulata2.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(42,'http://www.mushroom.world/data/fungi/Rhizinaundulata3.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(43,'http://www.mushroom.world/data/fungi/Psilocybesemilanceata1.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(43,'http://www.mushroom.world/data/fungi/Psilocybesemilanceata2.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(43,'http://www.mushroom.world/data/fungi/Psilocybesemilanceata3.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(43,'http://www.mushroom.world/data/fungi/Psilocybesemilanceata4.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(43,'http://www.mushroom.world/data/fungi/Psilocybesemilanceata5.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(43,'http://www.mushroom.world/data/fungi/Psilocybesemilanceata6.jpg');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(44,'http://www.mushroom.world/data/fungi/Psathyrellacandolleana1.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(44,'http://www.mushroom.world/data/fungi/Psathyrellacandolleana2.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(44,'http://www.mushroom.world/data/fungi/Psathyrellacandolleana3.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(44,'http://www.mushroom.world/data/fungi/Psathyrellacandolleana4.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(44,'http://www.mushroom.world/data/fungi/Psathyrellacandolleana5.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(45,'http://www.mushroom.world/data/fungi/Polyporussquamosus1.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(45,'http://www.mushroom.world/data/fungi/Polyporussquamosus2.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(45,'http://www.mushroom.world/data/fungi/Polyporussquamosus3.jpg');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(46,'http://www.mushroom.world/data/fungi/Polyporusciliatus1.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(46,'http://www.mushroom.world/data/fungi/Polyporusciliatus2.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(46,'http://www.mushroom.world/data/fungi/Polyporusciliatus3.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(46,'http://www.mushroom.world/data/fungi/Polyporusciliatus4.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(46,'http://www.mushroom.world/data/fungi/Polyporusciliatus5.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(47,'http://www.mushroom.world/data/fungi/Pholiotasquarrosa1.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(47,'http://www.mushroom.world/data/fungi/Pholiotasquarrosa2.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(47,'http://www.mushroom.world/data/fungi/Pholiotasquarrosa3.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(47,'http://www.mushroom.world/data/fungi/Pholiotasquarrosa4.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(47,'http://www.mushroom.world/data/fungi/Pholiotasquarrosa5.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(48,'http://www.mushroom.world/data/fungi/Pholiotaaurivella1.jpg');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(48,'http://www.mushroom.world/data/fungi/Pholiotaaurivella2.jpg');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(48,'http://www.mushroom.world/data/fungi/Pholiotaaurivella3.jpg');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(48,'http://www.mushroom.world/data/fungi/Pholiotaaurivella4.jpg');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(48,'http://www.mushroom.world/data/fungi/Pholiotaaurivella5.jpg');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(49,'http://www.mushroom.world/data/fungi/Pholiotaalnicola1.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(49,'http://www.mushroom.world/data/fungi/Pholiotaalnicola2.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(49,'http://www.mushroom.world/data/fungi/Pholiotaalnicola3.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(49,'http://www.mushroom.world/data/fungi/Pholiotaalnicola4.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(49,'http://www.mushroom.world/data/fungi/Pholiotaalnicola5.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(49,'http://www.mushroom.world/data/fungi/Pholiotaalnicola6.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(50,'http://www.mushroom.world/data/fungi/Phallusrubicundus1.jpg');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(50,'http://www.mushroom.world/data/fungi/Phallusrubicundus2.jpg');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(51,'http://www.mushroom.world/data/fungi/Paxillusinvolutus1.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(51,'http://www.mushroom.world/data/fungi/Paxillusinvolutus2.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(51,'http://www.mushroom.world/data/fungi/Paxillusinvolutus3.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(51,'http://www.mushroom.world/data/fungi/Paxillusinvolutus4.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(51,'http://www.mushroom.world/data/fungi/Paxillusinvolutus5.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(52,'http://www.mushroom.world/data/fungi/Paxillusatrotomentosus1.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(52,'http://www.mushroom.world/data/fungi/Paxillusatrotomentosus2.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(52,'http://www.mushroom.world/data/fungi/Paxillusatrotomentosus3.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(52,'http://www.mushroom.world/data/fungi/Paxillusatrotomentosus4.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(52,'http://www.mushroom.world/data/fungi/Paxillusatrotomentosus5.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(53,'http://www.mushroom.world/data/fungi/Otideaonotica1.jpg');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(53,'http://www.mushroom.world/data/fungi/Otideaonotica2.jpg');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(54,'http://www.mushroom.world/data/fungi/Mycenapura1.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(54,'http://www.mushroom.world/data/fungi/Mycenapura2.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(54,'http://www.mushroom.world/data/fungi/Mycenapura3.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(54,'http://www.mushroom.world/data/fungi/Mycenapura4.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(55,'http://www.mushroom.world/data/fungi/Mycenagalericulata1.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(55,'http://www.mushroom.world/data/fungi/Mycenagalericulata2.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(55,'http://www.mushroom.world/data/fungi/Mycenagalericulata3.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(55,'http://www.mushroom.world/data/fungi/Mycenagalericulata4.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(56,'http://www.mushroom.world/data/fungi/Morchellaelata1.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(56,'http://www.mushroom.world/data/fungi/Morchellaelata2.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(56,'http://www.mushroom.world/data/fungi/Morchellaelata3.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(56,'http://www.mushroom.world/data/fungi/Morchellaelata4.jpg');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(56,'http://www.mushroom.world/data/fungi/Morchellaelata5.jpg');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(57,'http://www.mushroom.world/data/fungi/Melanoleucacognata1.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(57,'http://www.mushroom.world/data/fungi/Melanoleucacognata2.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(57,'http://www.mushroom.world/data/fungi/Melanoleucacognata3.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(57,'http://www.mushroom.world/data/fungi/Melanoleucacognata4.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(58,'http://www.mushroom.world/data/fungi/Megacollybiaplatyphylla1.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(58,'http://www.mushroom.world/data/fungi/Megacollybiaplatyphylla2.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(58,'http://www.mushroom.world/data/fungi/Megacollybiaplatyphylla3.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(59,'http://www.mushroom.world/data/fungi/Marasmiusoreades1.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(59,'http://www.mushroom.world/data/fungi/Marasmiusoreades2.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(59,'http://www.mushroom.world/data/fungi/Marasmiusoreades3.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(59,'http://www.mushroom.world/data/fungi/Marasmiusoreades4.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(59,'http://www.mushroom.world/data/fungi/Marasmiusoreades5.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(60,'http://www.mushroom.world/data/fungi/Macrolepiotaprocera1.jpg');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(60,'http://www.mushroom.world/data/fungi/Macrolepiotaprocera2.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(60,'http://www.mushroom.world/data/fungi/Macrolepiotaprocera3.jpg');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(60,'http://www.mushroom.world/data/fungi/Macrolepiotaprocera4.jpg');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(60,'http://www.mushroom.world/data/fungi/Macrolepiotaprocera5.jpg');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(61,'http://www.mushroom.world/data/fungi/Macrolepiotarachodes1.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(61,'http://www.mushroom.world/data/fungi/Macrolepiotarachodes2.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(61,'http://www.mushroom.world/data/fungi/Macrolepiotarachodes3.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(61,'http://www.mushroom.world/data/fungi/Macrolepiotarachodes4.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(62,'http://www.mushroom.world/data/fungi/Lycoperdonpyriforme1.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(62,'http://www.mushroom.world/data/fungi/Lycoperdonpyriforme2.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(62,'http://www.mushroom.world/data/fungi/Lycoperdonpyriforme3.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(62,'http://www.mushroom.world/data/fungi/Lycoperdonpyriforme4.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(63,'http://www.mushroom.world/data/fungi/Lycoperdonperlatum1.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(63,'http://www.mushroom.world/data/fungi/Lycoperdonperlatum2.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(63,'http://www.mushroom.world/data/fungi/Lycoperdonperlatum3.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(63,'http://www.mushroom.world/data/fungi/Lycoperdonperlatum4.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(63,'http://www.mushroom.world/data/fungi/Lycoperdonperlatum5.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(64,'http://www.mushroom.world/data/fungi/Lycoperdonnigrescens1.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(64,'http://www.mushroom.world/data/fungi/Lycoperdonnigrescens2.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(64,'http://www.mushroom.world/data/fungi/Lycoperdonnigrescens3.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(64,'http://www.mushroom.world/data/fungi/Lycoperdonnigrescens4.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(64,'http://www.mushroom.world/data/fungi/Lycoperdonnigrescens5.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(65,'http://www.mushroom.world/data/fungi/Lycoperdonexcipuliforme1.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(65,'http://www.mushroom.world/data/fungi/Lycoperdonexcipuliforme2.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(65,'http://www.mushroom.world/data/fungi/Lycoperdonexcipuliforme3.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(65,'http://www.mushroom.world/data/fungi/Lycoperdonexcipuliforme4.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(66,'http://www.mushroom.world/data/fungi/Lepistanuda1.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(66,'http://www.mushroom.world/data/fungi/Lepistanuda2.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(66,'http://www.mushroom.world/data/fungi/Lepistanuda3.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(66,'http://www.mushroom.world/data/fungi/Lepistanuda4.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(66,'http://www.mushroom.world/data/fungi/Lepistanuda5.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(67,'http://www.mushroom.world/data/fungi/Leccinumversipelle1.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(67,'http://www.mushroom.world/data/fungi/Leccinumversipelle2.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(67,'http://www.mushroom.world/data/fungi/Leccinumversipelle3.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(67,'http://www.mushroom.world/data/fungi/Leccinumversipelle4.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(67,'http://www.mushroom.world/data/fungi/Leccinumversipelle5.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(68,'http://www.mushroom.world/data/fungi/Leccinumscabrum1.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(68,'http://www.mushroom.world/data/fungi/Leccinumscabrum2.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(68,'http://www.mushroom.world/data/fungi/Leccinumscabrum3.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(68,'http://www.mushroom.world/data/fungi/Leccinumscabrum4.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(68,'http://www.mushroom.world/data/fungi/Leccinumscabrum5.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(68,'http://www.mushroom.world/data/fungi/Leccinumscabrum6.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(69,'http://www.mushroom.world/data/fungi/Leccinumaurantiacum1.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(69,'http://www.mushroom.world/data/fungi/Leccinumaurantiacum2.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(69,'http://www.mushroom.world/data/fungi/Leccinumaurantiacum3.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(69,'http://www.mushroom.world/data/fungi/Leccinumaurantiacum4.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(70,'http://www.mushroom.world/data/fungi/Laetiporussulphureus1.jpg');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(70,'http://www.mushroom.world/data/fungi/Laetiporussulphureus2.jpg');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(70,'http://www.mushroom.world/data/fungi/Laetiporussulphureus3.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(70,'http://www.mushroom.world/data/fungi/Laetiporussulphureus4.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(71,'http://www.mushroom.world/data/fungi/Lactariusvolemus1.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(71,'http://www.mushroom.world/data/fungi/Lactariusvolemus2.jpg');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(71,'http://www.mushroom.world/data/fungi/Lactariusvolemus3.jpg');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(72,'http://www.mushroom.world/data/fungi/Lactariusturpis1.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(72,'http://www.mushroom.world/data/fungi/Lactariusturpis2.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(72,'http://www.mushroom.world/data/fungi/Lactariusturpis3.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(72,'http://www.mushroom.world/data/fungi/Lactariusturpis4.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(72,'http://www.mushroom.world/data/fungi/Lactariusturpis5.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(72,'http://www.mushroom.world/data/fungi/Lactariusturpis6.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(73,'http://www.mushroom.world/data/fungi/Lactariustrivialis1.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(73,'http://www.mushroom.world/data/fungi/Lactariustrivialis2.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(73,'http://www.mushroom.world/data/fungi/Lactariustrivialis3.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(73,'http://www.mushroom.world/data/fungi/Lactariustrivialis4.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(73,'http://www.mushroom.world/data/fungi/Lactariustrivialis5.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(73,'http://www.mushroom.world/data/fungi/Lactariustrivialis6.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(74,'http://www.mushroom.world/data/fungi/Lactariustorminosus1.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(74,'http://www.mushroom.world/data/fungi/Lactariustorminosus2.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(74,'http://www.mushroom.world/data/fungi/Lactariustorminosus3.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(74,'http://www.mushroom.world/data/fungi/Lactariustorminosus4.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(74,'http://www.mushroom.world/data/fungi/Lactariustorminosus5.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(74,'http://www.mushroom.world/data/fungi/Lactariustorminosus6.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(75,'http://www.mushroom.world/data/fungi/Lactariustabidus1.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(75,'http://www.mushroom.world/data/fungi/Lactariustabidus2.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(75,'http://www.mushroom.world/data/fungi/Lactariustabidus3.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(76,'http://www.mushroom.world/data/fungi/Lactariusrufus1.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(76,'http://www.mushroom.world/data/fungi/Lactariusrufus2.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(76,'http://www.mushroom.world/data/fungi/Lactariusrufus3.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(76,'http://www.mushroom.world/data/fungi/Lactariusrufus4.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(76,'http://www.mushroom.world/data/fungi/Lactariusrufus5.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(76,'http://www.mushroom.world/data/fungi/Lactariusrufus6.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(77,'http://www.mushroom.world/data/fungi/Lactariusmammosus1.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(77,'http://www.mushroom.world/data/fungi/Lactariusmammosus2.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(77,'http://www.mushroom.world/data/fungi/Lactariusmammosus3.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(77,'http://www.mushroom.world/data/fungi/Lactariusmammosus4.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(77,'http://www.mushroom.world/data/fungi/Lactariusmammosus5.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(78,'http://www.mushroom.world/data/fungi/Lactariuslignyotus1.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(78,'http://www.mushroom.world/data/fungi/Lactariuslignyotus2.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(78,'http://www.mushroom.world/data/fungi/Lactariuslignyotus3.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(78,'http://www.mushroom.world/data/fungi/Lactariuslignyotus4.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(78,'http://www.mushroom.world/data/fungi/Lactariuslignyotus5.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(79,'http://www.mushroom.world/data/fungi/Lactariushelvus1.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(79,'http://www.mushroom.world/data/fungi/Lactariushelvus2.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(79,'http://www.mushroom.world/data/fungi/Lactariushelvus3.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(79,'http://www.mushroom.world/data/fungi/Lactariushelvus4.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(79,'http://www.mushroom.world/data/fungi/Lactariushelvus5.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(79,'http://www.mushroom.world/data/fungi/Lactariushelvus6.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(80,'http://www.mushroom.world/data/fungi/Lactariusdeterrimus1.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(80,'http://www.mushroom.world/data/fungi/Lactariusdeterrimus2.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(80,'http://www.mushroom.world/data/fungi/Lactariusdeterrimus3.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(80,'http://www.mushroom.world/data/fungi/Lactariusdeterrimus4.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(80,'http://www.mushroom.world/data/fungi/Lactariusdeterrimus5.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(81,'http://www.mushroom.world/data/fungi/Lactariusdeliciosus1.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(81,'http://www.mushroom.world/data/fungi/Lactariusdeliciosus2.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(81,'http://www.mushroom.world/data/fungi/Lactariusdeliciosus3.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(81,'http://www.mushroom.world/data/fungi/Lactariusdeliciosus4.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(81,'http://www.mushroom.world/data/fungi/Lactariusdeliciosus5.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(82,'http://www.mushroom.world/data/fungi/Lactariuscamphoratus1.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(82,'http://www.mushroom.world/data/fungi/Lactariuscamphoratus2.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(82,'http://www.mushroom.world/data/fungi/Lactariuscamphoratus3.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(82,'http://www.mushroom.world/data/fungi/Lactariuscamphoratus4.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(82,'http://www.mushroom.world/data/fungi/Lactariuscamphoratus5.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(83,'http://www.mushroom.world/data/fungi/Laccarialaccata1.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(83,'http://www.mushroom.world/data/fungi/Laccarialaccata2.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(83,'http://www.mushroom.world/data/fungi/Laccarialaccata3.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(83,'http://www.mushroom.world/data/fungi/Laccarialaccata4.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(84,'http://www.mushroom.world/data/fungi/Kuehneromycesmutabilis1.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(84,'http://www.mushroom.world/data/fungi/Kuehneromycesmutabilis2.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(84,'http://www.mushroom.world/data/fungi/Kuehneromycesmutabilis3.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(84,'http://www.mushroom.world/data/fungi/Kuehneromycesmutabilis4.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(84,'http://www.mushroom.world/data/fungi/Kuehneromycesmutabilis5.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(85,'http://www.mushroom.world/data/fungi/Inocybelacera1.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(85,'http://www.mushroom.world/data/fungi/Inocybelacera2.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(85,'http://www.mushroom.world/data/fungi/Inocybelacera3.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(86,'http://www.mushroom.world/data/fungi/Hypholomamarginatum1.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(86,'http://www.mushroom.world/data/fungi/Hypholomamarginatum2.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(86,'http://www.mushroom.world/data/fungi/Hypholomamarginatum3.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(87,'http://www.mushroom.world/data/fungi/Hypholomafasciculare1.jpg');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(87,'http://www.mushroom.world/data/fungi/Hypholomafasciculare2.jpg');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(87,'http://www.mushroom.world/data/fungi/Hypholomafasciculare3.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(87,'http://www.mushroom.world/data/fungi/Hypholomafasciculare4.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(87,'http://www.mushroom.world/data/fungi/Hypholomafasciculare5.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(88,'http://www.mushroom.world/data/fungi/Hypholomacapnoides1.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(88,'http://www.mushroom.world/data/fungi/Hypholomacapnoides2.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(88,'http://www.mushroom.world/data/fungi/Hypholomacapnoides3.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(88,'http://www.mushroom.world/data/fungi/Hypholomacapnoides4.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(88,'http://www.mushroom.world/data/fungi/Hypholomacapnoides5.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(88,'http://www.mushroom.world/data/fungi/Hypholomacapnoides6.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(89,'http://www.mushroom.world/data/fungi/Hygrophorushypothejus1.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(89,'http://www.mushroom.world/data/fungi/Hygrophorushypothejus2.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(89,'http://www.mushroom.world/data/fungi/Hygrophorushypothejus3.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(89,'http://www.mushroom.world/data/fungi/Hygrophorushypothejus4.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(89,'http://www.mushroom.world/data/fungi/Hygrophorushypothejus5.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(90,'http://www.mushroom.world/data/fungi/Hygrophoruscamarophyllus1.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(90,'http://www.mushroom.world/data/fungi/Hygrophoruscamarophyllus2.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(90,'http://www.mushroom.world/data/fungi/Hygrophoruscamarophyllus3.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(90,'http://www.mushroom.world/data/fungi/Hygrophoruscamarophyllus4.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(90,'http://www.mushroom.world/data/fungi/Hygrophoruscamarophyllus5.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(91,'http://www.mushroom.world/data/fungi/Hygrophoropsisaurantiaca1.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(91,'http://www.mushroom.world/data/fungi/Hygrophoropsisaurantiaca2.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(91,'http://www.mushroom.world/data/fungi/Hygrophoropsisaurantiaca3.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(91,'http://www.mushroom.world/data/fungi/Hygrophoropsisaurantiaca4.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(91,'http://www.mushroom.world/data/fungi/Hygrophoropsisaurantiaca5.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(92,'http://www.mushroom.world/data/fungi/Hydnumrufescens1.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(92,'http://www.mushroom.world/data/fungi/Hydnumrufescens2.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(92,'http://www.mushroom.world/data/fungi/Hydnumrufescens3.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(92,'http://www.mushroom.world/data/fungi/Hydnumrufescens4.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(92,'http://www.mushroom.world/data/fungi/Hydnumrufescens5.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(92,'http://www.mushroom.world/data/fungi/Hydnumrufescens6.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(93,'http://www.mushroom.world/data/fungi/Hydnumrepandum1.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(93,'http://www.mushroom.world/data/fungi/Hydnumrepandum2.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(93,'http://www.mushroom.world/data/fungi/Hydnumrepandum3.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(93,'http://www.mushroom.world/data/fungi/Hydnumrepandum4.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(93,'http://www.mushroom.world/data/fungi/Hydnumrepandum5.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(93,'http://www.mushroom.world/data/fungi/Hydnumrepandum6.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(94,'http://www.mushroom.world/data/fungi/Hortiboletusrubellus1.jpg');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(94,'http://www.mushroom.world/data/fungi/Hortiboletusrubellus2.jpg');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(94,'http://www.mushroom.world/data/fungi/Hortiboletusrubellus3.jpg');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(95,'http://www.mushroom.world/data/fungi/Hericiumerinaceus1.jpg');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(95,'http://www.mushroom.world/data/fungi/Hericiumerinaceus2.jpg');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(95,'http://www.mushroom.world/data/fungi/Hericiumerinaceus3.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(96,'http://www.mushroom.world/data/fungi/Hebelomamesophaeum1.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(96,'http://www.mushroom.world/data/fungi/Hebelomamesophaeum2.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(96,'http://www.mushroom.world/data/fungi/Hebelomamesophaeum3.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(96,'http://www.mushroom.world/data/fungi/Hebelomamesophaeum4.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(96,'http://www.mushroom.world/data/fungi/Hebelomamesophaeum5.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(96,'http://www.mushroom.world/data/fungi/Hebelomamesophaeum6.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(97,'http://www.mushroom.world/data/fungi/Hebelomacrustuliniforme1.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(97,'http://www.mushroom.world/data/fungi/Hebelomacrustuliniforme2.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(97,'http://www.mushroom.world/data/fungi/Hebelomacrustuliniforme3.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(97,'http://www.mushroom.world/data/fungi/Hebelomacrustuliniforme4.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(97,'http://www.mushroom.world/data/fungi/Hebelomacrustuliniforme5.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(98,'http://www.mushroom.world/data/fungi/Gyromitrainfula1.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(98,'http://www.mushroom.world/data/fungi/Gyromitrainfula2.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(98,'http://www.mushroom.world/data/fungi/Gyromitrainfula3.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(98,'http://www.mushroom.world/data/fungi/Gyromitrainfula4.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(99,'http://www.mushroom.world/data/fungi/Gyromitraesculenta1.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(99,'http://www.mushroom.world/data/fungi/Gyromitraesculenta2.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(99,'http://www.mushroom.world/data/fungi/Gyromitraesculenta3.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(99,'http://www.mushroom.world/data/fungi/Gyromitraesculenta4.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(99,'http://www.mushroom.world/data/fungi/Gyromitraesculenta5.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(99,'http://www.mushroom.world/data/fungi/Gyromitraesculenta6.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(100,'http://www.mushroom.world/data/fungi/Gomphidiusglutinosus1.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(100,'http://www.mushroom.world/data/fungi/Gomphidiusglutinosus2.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(100,'http://www.mushroom.world/data/fungi/Gomphidiusglutinosus3.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(100,'http://www.mushroom.world/data/fungi/Gomphidiusglutinosus4.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(100,'http://www.mushroom.world/data/fungi/Gomphidiusglutinosus5.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(100,'http://www.mushroom.world/data/fungi/Gomphidiusglutinosus6.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(101,'http://www.mushroom.world/data/fungi/Galerinamarginata1.jpg');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(101,'http://www.mushroom.world/data/fungi/Galerinamarginata2.jpg');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(101,'http://www.mushroom.world/data/fungi/Galerinamarginata3.jpg');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(101,'http://www.mushroom.world/data/fungi/Galerinamarginata4.jpg');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(101,'http://www.mushroom.world/data/fungi/Galerinamarginata5.jpg');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(102,'http://www.mushroom.world/data/fungi/Entolomavernum1.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(102,'http://www.mushroom.world/data/fungi/Entolomavernum2.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(102,'http://www.mushroom.world/data/fungi/Entolomavernum3.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(102,'http://www.mushroom.world/data/fungi/Entolomavernum4.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(102,'http://www.mushroom.world/data/fungi/Entolomavernum5.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(102,'http://www.mushroom.world/data/fungi/Entolomavernum6.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(103,'http://www.mushroom.world/data/fungi/Entolomasericeum1.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(103,'http://www.mushroom.world/data/fungi/Entolomasericeum2.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(103,'http://www.mushroom.world/data/fungi/Entolomasericeum3.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(103,'http://www.mushroom.world/data/fungi/Entolomasericeum4.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(103,'http://www.mushroom.world/data/fungi/Entolomasericeum5.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(103,'http://www.mushroom.world/data/fungi/Entolomasericeum6.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(104,'http://www.mushroom.world/data/fungi/Cystodermaamianthinum1.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(104,'http://www.mushroom.world/data/fungi/Cystodermaamianthinum2.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(104,'http://www.mushroom.world/data/fungi/Cystodermaamianthinum3.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(105,'http://www.mushroom.world/data/fungi/Craterellustubaeformis1.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(105,'http://www.mushroom.world/data/fungi/Craterellustubaeformis2.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(105,'http://www.mushroom.world/data/fungi/Craterellustubaeformis3.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(105,'http://www.mushroom.world/data/fungi/Craterellustubaeformis4.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(106,'http://www.mushroom.world/data/fungi/Cortinariustraganus1.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(106,'http://www.mushroom.world/data/fungi/Cortinariustraganus2.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(106,'http://www.mushroom.world/data/fungi/Cortinariustraganus3.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(106,'http://www.mushroom.world/data/fungi/Cortinariustraganus4.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(106,'http://www.mushroom.world/data/fungi/Cortinariustraganus5.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(107,'http://www.mushroom.world/data/fungi/Cortinariussemisanguineus1.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(107,'http://www.mushroom.world/data/fungi/Cortinariussemisanguineus2.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(107,'http://www.mushroom.world/data/fungi/Cortinariussemisanguineus3.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(107,'http://www.mushroom.world/data/fungi/Cortinariussemisanguineus4.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(107,'http://www.mushroom.world/data/fungi/Cortinariussemisanguineus5.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(108,'http://www.mushroom.world/data/fungi/Cortinariusrubellus1.jpg');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(108,'http://www.mushroom.world/data/fungi/Cortinariusrubellus2.jpg');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(108,'http://www.mushroom.world/data/fungi/Cortinariusrubellus3.jpg');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(109,'http://www.mushroom.world/data/fungi/Cortinariusorellanus1.jpg');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(109,'http://www.mushroom.world/data/fungi/Cortinariusorellanus2.jpg');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(110,'http://www.mushroom.world/data/fungi/Cortinariusmucosus1.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(110,'http://www.mushroom.world/data/fungi/Cortinariusmucosus2.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(110,'http://www.mushroom.world/data/fungi/Cortinariusmucosus3.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(110,'http://www.mushroom.world/data/fungi/Cortinariusmucosus4.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(111,'http://www.mushroom.world/data/fungi/Cortinariusmalicorius1.jpg');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(111,'http://www.mushroom.world/data/fungi/Cortinariusmalicorius2.jpg');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(112,'http://www.mushroom.world/data/fungi/Cortinariuslaniger1.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(112,'http://www.mushroom.world/data/fungi/Cortinariuslaniger2.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(112,'http://www.mushroom.world/data/fungi/Cortinariuslaniger3.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(112,'http://www.mushroom.world/data/fungi/Cortinariuslaniger4.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(112,'http://www.mushroom.world/data/fungi/Cortinariuslaniger5.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(113,'http://www.mushroom.world/data/fungi/Cortinariuscroceus1.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(113,'http://www.mushroom.world/data/fungi/Cortinariuscroceus2.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(113,'http://www.mushroom.world/data/fungi/Cortinariuscroceus3.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(113,'http://www.mushroom.world/data/fungi/Cortinariuscroceus4.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(114,'http://www.mushroom.world/data/fungi/Cortinariuscollinitus1.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(114,'http://www.mushroom.world/data/fungi/Cortinariuscollinitus2.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(114,'http://www.mushroom.world/data/fungi/Cortinariuscollinitus3.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(114,'http://www.mushroom.world/data/fungi/Cortinariuscollinitus4.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(115,'http://www.mushroom.world/data/fungi/Cortinariuscaperatus1.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(115,'http://www.mushroom.world/data/fungi/Cortinariuscaperatus2.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(115,'http://www.mushroom.world/data/fungi/Cortinariuscaperatus3.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(115,'http://www.mushroom.world/data/fungi/Cortinariuscaperatus4.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(115,'http://www.mushroom.world/data/fungi/Cortinariuscaperatus5.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(115,'http://www.mushroom.world/data/fungi/Cortinariuscaperatus6.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(116,'http://www.mushroom.world/data/fungi/Cortinariusarmillatus1.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(116,'http://www.mushroom.world/data/fungi/Cortinariusarmillatus2.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(116,'http://www.mushroom.world/data/fungi/Cortinariusarmillatus3.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(116,'http://www.mushroom.world/data/fungi/Cortinariusarmillatus4.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(117,'http://www.mushroom.world/data/fungi/Cortinariusalboviolaceus1.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(117,'http://www.mushroom.world/data/fungi/Cortinariusalboviolaceus2.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(117,'http://www.mushroom.world/data/fungi/Cortinariusalboviolaceus3.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(118,'http://www.mushroom.world/data/fungi/Coprinusplicatilis1.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(118,'http://www.mushroom.world/data/fungi/Coprinusplicatilis2.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(118,'http://www.mushroom.world/data/fungi/Coprinusplicatilis3.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(118,'http://www.mushroom.world/data/fungi/Coprinusplicatilis4.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(118,'http://www.mushroom.world/data/fungi/Coprinusplicatilis5.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(118,'http://www.mushroom.world/data/fungi/Coprinusplicatilis6.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(119,'http://www.mushroom.world/data/fungi/Coprinuscomatus1.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(119,'http://www.mushroom.world/data/fungi/Coprinuscomatus2.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(119,'http://www.mushroom.world/data/fungi/Coprinuscomatus3.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(119,'http://www.mushroom.world/data/fungi/Coprinuscomatus4.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(119,'http://www.mushroom.world/data/fungi/Coprinuscomatus5.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(120,'http://www.mushroom.world/data/fungi/Coprinopsisatramentaria1.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(120,'http://www.mushroom.world/data/fungi/Coprinopsisatramentaria2.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(120,'http://www.mushroom.world/data/fungi/Coprinopsisatramentaria3.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(120,'http://www.mushroom.world/data/fungi/Coprinopsisatramentaria4.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(120,'http://www.mushroom.world/data/fungi/Coprinopsisatramentaria5.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(120,'http://www.mushroom.world/data/fungi/Coprinopsisatramentaria6.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(121,'http://www.mushroom.world/data/fungi/Coltriciaperennis1.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(121,'http://www.mushroom.world/data/fungi/Coltriciaperennis2.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(121,'http://www.mushroom.world/data/fungi/Coltriciaperennis3.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(121,'http://www.mushroom.world/data/fungi/Coltriciaperennis4.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(121,'http://www.mushroom.world/data/fungi/Coltriciaperennis5.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(122,'http://www.mushroom.world/data/fungi/Collybiadryophila1.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(122,'http://www.mushroom.world/data/fungi/Collybiadryophila2.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(122,'http://www.mushroom.world/data/fungi/Collybiadryophila3.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(122,'http://www.mushroom.world/data/fungi/Collybiadryophila4.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(123,'http://www.mushroom.world/data/fungi/Clitopilusprunulus1.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(123,'http://www.mushroom.world/data/fungi/Clitopilusprunulus2.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(123,'http://www.mushroom.world/data/fungi/Clitopilusprunulus3.jpg');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(124,'http://www.mushroom.world/data/fungi/Clitocybenebularis1.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(124,'http://www.mushroom.world/data/fungi/Clitocybenebularis2.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(124,'http://www.mushroom.world/data/fungi/Clitocybenebularis3.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(124,'http://www.mushroom.world/data/fungi/Clitocybenebularis4.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(124,'http://www.mushroom.world/data/fungi/Clitocybenebularis5.jpg');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(125,'http://www.mushroom.world/data/fungi/Clitocybegibba1.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(125,'http://www.mushroom.world/data/fungi/Clitocybegibba2.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(125,'http://www.mushroom.world/data/fungi/Clitocybegibba3.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(125,'http://www.mushroom.world/data/fungi/Clitocybegibba4.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(125,'http://www.mushroom.world/data/fungi/Clitocybegibba5.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(125,'http://www.mushroom.world/data/fungi/Clitocybegibba6.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(126,'http://www.mushroom.world/data/fungi/Clitocybeclavipes1.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(126,'http://www.mushroom.world/data/fungi/Clitocybeclavipes2.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(126,'http://www.mushroom.world/data/fungi/Clitocybeclavipes3.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(126,'http://www.mushroom.world/data/fungi/Clitocybeclavipes4.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(126,'http://www.mushroom.world/data/fungi/Clitocybeclavipes5.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(127,'http://www.mushroom.world/data/fungi/Chalciporuspiperatus1.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(127,'http://www.mushroom.world/data/fungi/Chalciporuspiperatus2.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(127,'http://www.mushroom.world/data/fungi/Chalciporuspiperatus3.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(127,'http://www.mushroom.world/data/fungi/Chalciporuspiperatus4.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(127,'http://www.mushroom.world/data/fungi/Chalciporuspiperatus5.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(127,'http://www.mushroom.world/data/fungi/Chalciporuspiperatus6.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(128,'http://www.mushroom.world/data/fungi/Cantharelluscibarius1.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(128,'http://www.mushroom.world/data/fungi/Cantharelluscibarius2.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(128,'http://www.mushroom.world/data/fungi/Cantharelluscibarius3.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(128,'http://www.mushroom.world/data/fungi/Cantharelluscibarius4.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(128,'http://www.mushroom.world/data/fungi/Cantharelluscibarius5.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(128,'http://www.mushroom.world/data/fungi/Cantharelluscibarius6.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(129,'http://www.mushroom.world/data/fungi/Cantharellulaumbonata1.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(129,'http://www.mushroom.world/data/fungi/Cantharellulaumbonata2.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(129,'http://www.mushroom.world/data/fungi/Cantharellulaumbonata3.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(129,'http://www.mushroom.world/data/fungi/Cantharellulaumbonata4.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(130,'http://www.mushroom.world/data/fungi/Calocybepersicolor1.jpg');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(131,'http://www.mushroom.world/data/fungi/Calocybegambosa1.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(131,'http://www.mushroom.world/data/fungi/Calocybegambosa2.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(131,'http://www.mushroom.world/data/fungi/Calocybegambosa3.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(132,'http://www.mushroom.world/data/fungi/Caloceraviscosa1.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(132,'http://www.mushroom.world/data/fungi/Caloceraviscosa2.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(133,'http://www.mushroom.world/data/fungi/Bovistaplumbea1.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(133,'http://www.mushroom.world/data/fungi/Bovistaplumbea2.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(133,'http://www.mushroom.world/data/fungi/Bovistaplumbea3.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(133,'http://www.mushroom.world/data/fungi/Bovistaplumbea4.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(133,'http://www.mushroom.world/data/fungi/Bovistaplumbea5.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(134,'http://www.mushroom.world/data/fungi/Bondarzewiaberkeleyi1.jpg');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(134,'http://www.mushroom.world/data/fungi/Bondarzewiaberkeleyi2.jpg');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(134,'http://www.mushroom.world/data/fungi/Bondarzewiaberkeleyi3.jpg');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(135,'http://www.mushroom.world/data/fungi/Boletussubtomentosus1.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(135,'http://www.mushroom.world/data/fungi/Boletussubtomentosus2.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(135,'http://www.mushroom.world/data/fungi/Boletussubtomentosus3.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(135,'http://www.mushroom.world/data/fungi/Boletussubtomentosus4.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(135,'http://www.mushroom.world/data/fungi/Boletussubtomentosus5.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(135,'http://www.mushroom.world/data/fungi/Boletussubtomentosus6.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(135,'http://www.mushroom.world/data/fungi/Boletussubtomentosus7.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(136,'http://www.mushroom.world/data/fungi/Boletussatanas1.jpg');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(136,'http://www.mushroom.world/data/fungi/Boletussatanas2.jpg');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(137,'http://www.mushroom.world/data/fungi/Boletuspinophilus1.jpg');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(137,'http://www.mushroom.world/data/fungi/Boletuspinophilus2.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(137,'http://www.mushroom.world/data/fungi/Boletuspinophilus3.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(137,'http://www.mushroom.world/data/fungi/Boletuspinophilus4.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(137,'http://www.mushroom.world/data/fungi/Boletuspinophilus5.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(137,'http://www.mushroom.world/data/fungi/Boletuspinophilus6.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(138,'http://www.mushroom.world/data/fungi/Boletusedulis1.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(138,'http://www.mushroom.world/data/fungi/Boletusedulis2.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(138,'http://www.mushroom.world/data/fungi/Boletusedulis3.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(138,'http://www.mushroom.world/data/fungi/Boletusedulis4.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(138,'http://www.mushroom.world/data/fungi/Boletusedulis5.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(138,'http://www.mushroom.world/data/fungi/Boletusedulis6.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(139,'http://www.mushroom.world/data/fungi/Boletusbadius1.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(139,'http://www.mushroom.world/data/fungi/Boletusbadius2.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(139,'http://www.mushroom.world/data/fungi/Boletusbadius3.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(139,'http://www.mushroom.world/data/fungi/Boletusbadius4.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(139,'http://www.mushroom.world/data/fungi/Boletusbadius5.JPG');
INSERT INTO mushroom_image(id_mushroom, URL) VALUES(139,'http://www.mushroom.world/data/fungi/Boletusbadius7.JPG');
