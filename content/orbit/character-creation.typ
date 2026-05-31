#import "../index.typ": *

#show: template.with(
  title: "Orbit Character Creation"
)

This module turns Orbit's Push Point assumptions into a character creation budget. The printable sheet and richer template layout live in the Orbit source PDFs.

#outline()

= Objectives

The character creation system pretty much boils down to fleshing out the assumptions the resolution system is built upon to allow for variety in power levels, while preserving build variety.

== Character Creation

The core concept is that you invest Push Points to obtain permanent die size increases.

#quote(block: true)[
*Character Creation*

The cost to permanently increase an ability is:
#table(
  columns: (auto, auto, 1fr),
  [*Die Step*], [*Cost*], [*Descriptors*],
  [d6 $->$ d4], [-1 point\*], [Not great],
  [d6 $->$ d8], [1 point], [Pretty great],
  [d8 $->$ d10], [2 points], [Incredible],
  [d10 $->$ d12], [3 points], [Peak human ability],
)

\*You can lower an ability to d4 to gain one Push Point.
]

The numbers are adjustable, but I find this works pretty well already.

== Budgeting

Depending on the desired power level, you'd set different starting budgets. A good rule of thumb for a starting point is 2 points per ability score present. With six abilities, that's 12.

Assuming 6 abilities, good defaults are:
#table(
  columns: (auto, auto),
  [*Tone*], [*Budget*],
  [Gritty], [9],
  [General], [12],
  [Heroic], [15],
)

In the western example, I used 8, because I wanted a lethal, quick and gritty setting and vibe. Play around with some builds yourself before telling the players your budget to see what they can build.

== Presets

It's a good idea to provide templates. Once you've set a budget, make some example builds.

The examples below use six names from the example core skill list in the resolution system: Strength, Dexterity, Perception, Charisma, Intelligence, and Endurance. In a finished system, replace the ability names and the metacurrency name with the ones used by that setting. If the system uses Luck as a seventh ability, add it to the ability list and adjust the budget. The number shown for Push Points is the remaining rechargeable limit after buying the listed ability changes from the d6 baseline.

#table(
  columns: (auto, auto, auto, 1fr, 1.4fr),
  [*Budget*], [*Preset*], [*Push Points*], [*Ability Changes*], [*Notes*],
  [9], [Hardcase Scout], [4], [Strength d8, Dexterity d10, Perception d8, Charisma d4, Endurance d8], [Excellent under pressure, but socially brittle and short on reserves.],
  [9], [Silver Tongue Survivor], [5], [Strength d4, Perception d8, Charisma d10, Intelligence d8], [Talks first, reads the room well, and avoids direct physical contests.],
  [12], [Field Medic], [4], [Perception d10, Charisma d8, Intelligence d10, Endurance d8], [A focused support specialist who solves problems with expertise and steady hands.],
  [12], [Duelist], [5], [Strength d8, Dexterity d10, Perception d8, Charisma d10, Intelligence d4], [Strong in tense confrontations, less useful when patience or study matters.],
  [15], [Paragon], [5], [Strength d10, Dexterity d10, Perception d8, Charisma d8, Intelligence d8, Endurance d8], [Broadly exceptional, with enough reserves to push through important scenes.],
  [15], [Mastermind], [3], [Strength d4, Perception d12, Charisma d10, Intelligence d10, Endurance d8], [Dominates planning and social leverage, but has little room for brute force or repeated pushes.],
)

== Printable Version

The source version includes a fuller printable character sheet and richer template cards. See #link("https://github.com/soliprem/orbit/blob/main/character-creation.typ")[character-creation.typ] or #link("https://github.com/soliprem/orbit/blob/main/character-creation.pdf")[character-creation.pdf] in the Orbit repository.
