# Installation

import Tabs from '@theme/Tabs';
import TabItem from '@theme/TabItem';

## **Standalone Installer**

<Tabs groupId="os">
<TabItem value="mac-linux" label="macOS & Linux" default>

```bash
curl -fsSL https://raw.githubusercontent.com/mindfiredigital/gpx/main/scripts/install.sh | bash
```

</TabItem>
<TabItem value="windows" label="Windows (PowerShell)">

```powershell
iwr -useb https://raw.githubusercontent.com/mindfiredigital/gpx/main/scripts/install.ps1 | iex
```

</TabItem>
</Tabs>

## **npm**

<Tabs groupId="package-managers">
<TabItem value="npm" label="npm" default>

```bash
npm install -g @mindfiredigital/gpx
```

</TabItem>
<TabItem value="yarn" label="Yarn">

```bash
yarn global add @mindfiredigital/gpx
```

</TabItem>
<TabItem value="pnpm" label="pnpm">

```bash
pnpm add -g @mindfiredigital/gpx
```

</TabItem>
<TabItem value="bun" label="Bun">

```bash
bun add -g @mindfiredigital/gpx
```

</TabItem>
</Tabs>

Verify the installation:

```
gpx --version
```

If you see a version number - you're good to go.

---

## Start using gpx

Set up your first profile:

```
gpx add personal
```

Switch to it:

```
gpx use personal
```

Check it's active:

```
gpx current
```

That's it - you're set up. Head over to the [Commands](./commands/Add) section to explore everything gpx can do.

## Demo
<video style={{ maxWidth: '800px', width: '50%', display: 'block', borderRadius: '4px', margin: '0 auto' }} autoPlay loop muted playsInline controls>
  <source src={require('@site/static/img/gpx-quick-start.mp4').default}/>
</video>