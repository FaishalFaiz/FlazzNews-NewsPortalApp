---
name: Dynamic Pulse News
colors:
  surface: '#fcf9f8'
  surface-dim: '#dcd9d9'
  surface-bright: '#fcf9f8'
  surface-container-lowest: '#ffffff'
  surface-container-low: '#f6f3f2'
  surface-container: '#f0eded'
  surface-container-high: '#eae7e7'
  surface-container-highest: '#e5e2e1'
  on-surface: '#1b1b1c'
  on-surface-variant: '#584235'
  inverse-surface: '#303030'
  inverse-on-surface: '#f3f0ef'
  outline: '#8c7263'
  outline-variant: '#e0c0af'
  surface-tint: '#994700'
  primary: '#994700'
  on-primary: '#ffffff'
  primary-container: '#ff7a00'
  on-primary-container: '#5c2800'
  inverse-primary: '#ffb68b'
  secondary: '#5f5e5e'
  on-secondary: '#ffffff'
  secondary-container: '#e5e2e1'
  on-secondary-container: '#656464'
  tertiary: '#914d00'
  on-tertiary: '#ffffff'
  tertiary-container: '#ea8828'
  on-tertiary-container: '#572c00'
  error: '#ba1a1a'
  on-error: '#ffffff'
  error-container: '#ffdad6'
  on-error-container: '#93000a'
  primary-fixed: '#ffdbc8'
  primary-fixed-dim: '#ffb68b'
  on-primary-fixed: '#321200'
  on-primary-fixed-variant: '#753400'
  secondary-fixed: '#e5e2e1'
  secondary-fixed-dim: '#c8c6c5'
  on-secondary-fixed: '#1c1b1b'
  on-secondary-fixed-variant: '#474646'
  tertiary-fixed: '#ffdcc3'
  tertiary-fixed-dim: '#ffb77d'
  on-tertiary-fixed: '#2f1500'
  on-tertiary-fixed-variant: '#6e3900'
  background: '#fcf9f8'
  on-background: '#1b1b1c'
  surface-variant: '#e5e2e1'
typography:
  display-lg:
    fontFamily: Plus Jakarta Sans
    fontSize: 32px
    fontWeight: '800'
    lineHeight: 40px
  headline-lg:
    fontFamily: Plus Jakarta Sans
    fontSize: 26px
    fontWeight: '700'
    lineHeight: 34px
  headline-md:
    fontFamily: Plus Jakarta Sans
    fontSize: 22px
    fontWeight: '700'
    lineHeight: 30px
  headline-sm:
    fontFamily: Plus Jakarta Sans
    fontSize: 18px
    fontWeight: '700'
    lineHeight: 26px
  title-lg:
    fontFamily: Plus Jakarta Sans
    fontSize: 16px
    fontWeight: '700'
    lineHeight: 22px
  title-md:
    fontFamily: Plus Jakarta Sans
    fontSize: 14px
    fontWeight: '600'
    lineHeight: 20px
  body-lg:
    fontFamily: Plus Jakarta Sans
    fontSize: 16px
    fontWeight: '400'
    lineHeight: 26px
  body-md:
    fontFamily: Plus Jakarta Sans
    fontSize: 14px
    fontWeight: '400'
    lineHeight: 22px
  body-sm:
    fontFamily: Plus Jakarta Sans
    fontSize: 12px
    fontWeight: '400'
    lineHeight: 18px
  label-lg:
    fontFamily: Plus Jakarta Sans
    fontSize: 14px
    fontWeight: '600'
    lineHeight: 20px
  label-md:
    fontFamily: Plus Jakarta Sans
    fontSize: 12px
    fontWeight: '600'
    lineHeight: 16px
  label-sm:
    fontFamily: Plus Jakarta Sans
    fontSize: 11px
    fontWeight: '500'
    lineHeight: 14px
rounded:
  sm: 0.25rem
  DEFAULT: 0.5rem
  md: 0.75rem
  lg: 1rem
  xl: 1.5rem
  full: 9999px
spacing:
  gutter: 1rem
  margin: 1.25rem
  space-xs: 0.25rem
  space-sm: 0.5rem
  space-md: 0.875rem
  space-lg: 1.25rem
  space-xl: 1.75rem
---

## Brand & Style

This design system delivers a fast-paced, authoritative, and contemporary mobile news reading experience tailored for modern Flutter applications. Grounded in Material Design 3 (M3) principles, the system balances editorial structure with energetic, high-contrast digital utility.

### Brand Personality & Emotional Core
- **Urgent yet Composed:** Anchored by a vibrant citrus orange accent against deep ink black, signaling breaking developments without inducing anxiety or clutter.
- **Legible & Editorial:** Typographic clarity reigns supreme; dense information flows naturally into digestible cards, horizontal carousels, and scannable headline groups.
- **Tactile & Fluid:** Leverages M3 elevation tiers, soft ambient depth, and responsive tap targets to make content feel like dynamic, stacked paper surfaces.

### Target Audience
Mobile-first news consumers, knowledge workers, and curious modern readers seeking timely updates across culture, geopolitics, technology, and finance through curated, personalized feeds.

### Design Movement: Modern Editorial Minimalism
A fusion of Google's Material You / M3 structural foundations and clean Scandinavian publication design:
- Pure whites and warm off-white surface tiers (`#FFFFFF`, `#F6F7F9`).
- Ample negative breathing room framing rich photography.
- High-contrast typography hierarchy utilizing crisp, rounded sans-serif letterforms.
- Smooth corner radiuses (16px to 24px) for cards, and full pill chips for tags and interactive selectors.

## Colors

The palette is engineered for Flutter's `ColorScheme` architecture, creating distinct roles across light and dark rendering modes while prioritizing contrast ratios compliant with WCAG 2.1 AA/AAA standards for mobile readability.

### Light Theme Mapping (`ThemeData.light()`)
- **`primary` (`#FF7A00`):** Vibrant orange for brand marks, active tab indicators, primary action accents, and breaking updates.
- **`onPrimary` (`#FFFFFF`):** Pure white for maximum contrast on primary fills.
- **`primaryContainer` (`#FFF3E6`):** Soft warm peach tint for highlighted badges and selected interest tags.
- **`onPrimaryContainer` (`#803800`):** Deep burnt sienna for accessible text inside tinted containers.
- **`secondary` / `onSecondaryContainer` (`#121212`):** Pitch black for primary action buttons (e.g., "Save", "Follow") and high-emphasis headlines.
- **`surface` (`#FFFFFF`):** Baseline app canvas and elevated hero card sheets.
- **`surfaceVariant` (`#F6F7F9`):** Neutral container fill for input search fields, unselected tag chips, and card backgrounds.
- **`onSurface` (`#121212`):** Deep ink black for primary titles, bold headlines, and prominent labels.
- **`onSurfaceVariant` (`#6B7280`):** Muted cool gray for timestamps, bylines, reading duration, and inactive icons.
- **`outline` (`#E5E7EB`):** Subtle border delineations for non-elevated card containers and chip borders.

### Dark Theme Mapping (`ThemeData.dark()`)
- **`primary` (`#FF9838`):** Lighter, desaturated tangerine to reduce optical halation on dark canvas.
- **`surface` (`#121212`):** Ink black base canvas.
- **`surfaceVariant` (`#1E1E1E`):** Layered card and search bar containers.
- **`onSurface` (`#F9FAFB`):** Soft luminous white for titles.
- **`onSurfaceVariant` (`#9CA3AF`):** Muted silver for metadata.
- **`outline` (`#2D3139`):** Subdued surface boundaries.

## Typography

The type system is powered by **Plus Jakarta Sans**, offering geometric precision paired with warm humanistic terminal curves. This typeface excels at both compact mobile data scales and bold editorial titling.

### Hierarchy & Mobile Application
- **Display & Headline (`display-lg`, `headline-lg`):** Reserved for primary onboarding inquiries (e.g., *"Pick your interests"*) and full-screen lead hero stories. Weights sit strictly between Bold (700) and ExtraBold (800) with tightened tracking (-0.02em) to maintain visual punch.
- **Titles (`headline-sm`, `title-lg`, `title-md`):** Tailored for news headlines across compact and expanded cards. Maximum 2–3 line clamping with snug vertical leadings ensures rapid eye scanning across feed streams.
- **Body (`body-lg`, `body-md`):** Tuned for sustained editorial reading comfort. Generous 1.6x line heights guard against cognitive fatigue on small screens.
- **Labels & Metadata (`label-md`, `label-sm`):** Handles author bylines, publication timestamps, channel tags, and category chips. Rendered in semi-bold weights for high contrast even at micro sizes.

## Layout & Spacing

This layout paradigm utilizes an adaptable 4-column mobile fluid grid moving to 8 columns on tablet devices, bound by a consistent 4pt/8pt spatial increment.

### Structural Parameters
- **Canvas Margins (`margin` / 20px):** Safe boundary inset on mobile portrait devices (`EdgeInsets.symmetric(horizontal: 20)`), keeping news feeds comfortably offset from hardware edges.
- **Grid Gutters (`gutter` / 16px):** Standard separation between multi-column grid layouts such as the 2-column "Pick Your Interests" image-tile matrix.
- **Feed Card Spacing (`space-lg` / 20px):** Vertical separation between continuous feed stories, providing distinct mental demarcation without hard horizontal divider lines.
- **Internal Density (`space-xs` to `space-md`):** Micro-spacing for metadata rows (avatar + author + dot separator + timestamp) locked to 4px–8px increments.

## Elevation & Depth

Visual hierarchy relies primarily on **tonal containment** and **soft ambient diffusion**, replacing aggressive hard drop shadows with clean material tiers.

### Elevation Levels
- **Level 0 (Flat Baseline):** Canvas background (`#FFFFFF` in light mode, `#121212` in dark mode).
- **Level 1 (Tonal Surfaces):** Subtly separated items such as search input bars, unselected interest chips, and metadata badges. Implemented with `surfaceVariant` (`#F6F7F9`) and a 1px border of `outline` (`#E5E7EB`). Zero shadow blur.
- **Level 2 (Editorial Cards & Floating Navigation):** High-priority news cards and the bottom navigation bar. Elevated with soft, ultra-diffused drop shadows:
  - `offset: (0, 6)`
  - `blurRadius: 20`
  - `color: Color.fromRGBO(18, 18, 18, 0.05)`
- **Level 3 (Modal & Action Sheets):** Dialogs, bottom sheets, and full-bleed action bars. Elevated with `blurRadius: 28`, `color: Color.fromRGBO(0, 0, 0, 0.12)`.
- **Image Overlays & Hero Readability:** Full-card image tiles (such as Interest Pickers and Hero News items) utilize a dynamic bottom-to-top linear gradient overlay (`Colors.transparent` to `Color.fromRGBO(0, 0, 0, 0.65)`), guaranteeing contrast for overlaid white typography.

## Shapes

The design system standardizes on generous Material 3 corner curves, creating an approachable, contemporary visual rhythm across touchpoints.

### Shape Scale Guidelines
- **Extra Small (8px / `BorderRadius.circular(8)`):** Thumbnail image previews in compact news list rows.
- **Small (12px / `BorderRadius.circular(12)`):** Search input fields, dropdown menus, and standard input boxes.
- **Medium / Large (16px–24px / `BorderRadius.circular(20)`):** Feed news cards, interest selection tiles, and featured hero banners.
- **Full Pill (9999px / `StadiumBorder`):** Category filter chips, interaction buttons ("Save", "Follow"), and bottom navigation active pill indicators.

## Components

Standardized specifications for Flutter component implementations:

### 1. Navigation & App Bar
- **Header App Bar (`AppBar`):** Left-aligned dual-tone brand badge (Orange rounded rect container holding "Flazz" in white, black tag container holding "NEWS"). Right action includes an unread notification bell badge with a primary orange indicator dot.
- **Category Tab Bar (`TabBar`):** Scrollable, zero-elevation horizontal category bar. Selected tab features bold typography (`label-lg`) with a solid orange underline indicator (3px thickness, rounded ends). Unselected tabs use muted gray (`#6B7280`).
- **Material 3 Navigation Bar (`NavigationBar`):** 5-destination layout (Home, Explore, Coverage, Saved, Profile). Active tab is highlighted with an orange accent indicator bar above the icon or subtle pill shape, with matching orange icon and label.

### 2. Search Bar Widget
- **Styling:** Styled after M3 `SearchBar`. Background fill `surfaceVariant` (`#F6F7F9`), zero drop shadow, 12px corner radius.
- **Iconography:** Inactive gray search lens (`#9CA3AF`) positioned leading; clear cross button trailing on active text input. Placeholder text: *"Search"* in `body-md` muted gray.

### 3. Chips & Tags
- **Hash / Topic Chips (`FilterChip` / `ActionChip`):** Background `surfaceVariant` (`#F6F7F9`), shape `StadiumBorder` or `RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))`. Text format `#TopicName` in `label-md` (`#4B5563`). On tap: fill shifts to `primaryContainer` (`#FFF3E6`) with `primary` (`#FF7A00`) text.

### 4. Cards
- **Interest Selection Card:** 2-column grid item with 16px corner radius. High-resolution background photo beneath a dark vignette gradient. Centered bold title (`title-lg`, white). Top-right or bottom-right selection circle indicator (24px diameter, 2px white border; filled with white dot on select).
- **Hero / Lead News Card:** Vertical stack. Full-width top image (16px border radius, 16:9 ratio). Headline underneath in `headline-sm` ink black. Bottom metadata row: source name in orange (`#FF7A00`), bullet dot separator, relative post time (`4min ago`) in muted gray.
- **Compact News Row Item:** Asymmetric horizontal card. Left column contains headline (`title-md`, max 2 lines) and metadata row. Right column features a square thumbnail (72px × 72px or 80px × 80px) with 12px rounded corners.

### 5. Buttons
- **Primary Action Button (`ElevatedButton` / `FilledButton`):** Deep charcoal or ink black fill (`#121212`), white text (`#FFFFFF`), `StadiumBorder` (full pill), 52px height for primary mobile thumb reachability.
- **Accent Button:** Vibrant primary orange fill (`#FF7A00`), white text, used for critical user actions (e.g., breaking subscriptions, personalized onboarding).
- **Tonal Button:** Soft container fill (`#F6F7F9`), dark text, for secondary utility actions.

### 6. Interactive State Controls
- **Social Action Counters:** Embedded in card footers (Like, Comment, Share). Monoline icon (20px) paired with compact counter in `label-sm` muted gray, switching to primary orange when activated.