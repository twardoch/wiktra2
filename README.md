# Wiktra: High-Quality Transliteration Powered by Wiktionary

**Wiktra** is a versatile Unicode transliteration tool that brings the linguistic precision of Wiktionary's community-curated transliteration modules to your command line and Python projects. It allows you to convert text from one writing system (script) to another with a high degree of accuracy.

**Project Locations:**

*   Upstream (slower releases): [github.com/kbatsuren/wiktra](https://github.com/kbatsuren/wiktra/)
*   Active Development (Wiktra 2+): [github.com/twardoch/wiktra2](https://github.com/twardoch/wiktra2/) (This documentation primarily refers to Wiktra 2+)

## What is Wiktra?

At its core, Wiktra transliterates text. This means it converts characters or words from one script (e.g., Cyrillic, Arabic, Devanagari) into another (e.g., Latin script). Unlike simple character-by-character replacement, Wiktra utilizes sophisticated rule-based transliteration modules written in Lua, developed and maintained by linguists and contributors on Wiktionary. These modules understand the nuances of how languages are written, leading to more accurate and contextually appropriate results.

Wiktra provides:

*   A command-line interface (CLI) tool: `wiktrapy`
*   A Python 3 module: `wiktra`

Wiktra 1.0 was originally developed by Khuyagbaatar Batsuren. Wiktra 2 was significantly rewritten by Adam Twardoch.

## Who is Wiktra For?

Wiktra is designed for a diverse range of users:

*   **Linguists and Language Researchers:** Access accurate transliterations for a vast number of languages and scripts, aiding in comparative studies, data processing, and phonetic analysis.
*   **Software Developers:** Integrate transliteration capabilities into applications dealing with multilingual text, internationalization (i18n), or natural language processing (NLP).
*   **Archivists and Librarians:** Standardize text from various scripts for cataloging and digital preservation.
*   **Students and Language Learners:** Understand pronunciation and script conversions for different languages.
*   **Anyone working with multilingual data:** Convert text to a common script for easier processing, analysis, or display.

## Why is Wiktra Useful?

*   **High-Quality Transliterations:** Leverages the extensive, collaboratively maintained Lua-based transliteration modules from Wiktionary, ensuring a high standard of accuracy.
*   **Broad Language and Script Support:** Wiktra 2 supports a vast number of languages and scripts (e.g., 514 languages in 102 scripts in the new API as per original README), covering a significant portion of Wiktionary's transliteration capabilities. Use `wiktrapy --stats` for a current list.
*   **Flexibility:** Usable as both a standalone CLI tool for quick conversions and as a Python library for integration into larger projects.
*   **Offline Capability:** Once Wiktionary modules are packaged or updated locally, transliteration can be performed offline.
*   **Open Source:** Licensed under GPLv2, allowing for community contributions and transparency.

## Installation

Wiktra requires Python 3.9+ and Lua (specifically LuaJIT is recommended for performance with the `lupa` bridge).

**General Installation (using pip):**

The primary way to install Wiktra is via pip:

```bash
python3 -m pip install wiktra
```

This will attempt to install Wiktra and its Python dependencies, including `lupa`, which bridges Python and Lua. The `lupa` installation might require Lua development headers to be present on your system.

**macOS:**

For macOS, a convenience script `install-mac.sh` (available in the source repository) can help install prerequisites like Lua via Homebrew:

1.  Download or clone the Wiktra repository.
2.  Navigate to the repository's root directory in your terminal.
3.  Run the script:
    ```bash
    ./install-mac.sh
    ```
4.  Then, install Wiktra using pip (if the script doesn't do it already, or to ensure you have the latest version from PyPI):
    ```bash
    # If installing from a local clone after running the script:
    python3 -m pip install --upgrade .
    # Or to get the latest from PyPI:
    python3 -m pip install --upgrade wiktra
    ```

**Linux (Debian/Ubuntu Example):**

You'll need to install Python 3, pip, and Lua development files.

```bash
sudo apt update
sudo apt install python3 python3-pip liblua5.1-0-dev luajit
# For lupa, LuaJIT (libluajit-5.1-dev) is often preferred over standard Lua dev packages.
# Depending on your distribution and lupa version, you might need different Lua versions like lua5.3-dev etc.
python3 -m pip install wiktra
```

**Windows:**

Installation on Windows can be more complex due to `lupa` compilation.
1.  Install Python 3.9+ (e.g., from python.org). Make sure to add Python to your PATH.
2.  Installing `lupa` typically requires a C compiler (like Microsoft C++ Build Tools, often installed with Visual Studio) and Lua (e.g., by compiling Lua from source, or using a package manager like Scoop or Chocolatey to install Lua/LuaJIT).
3.  It's often easier if pre-compiled `lupa` wheels are available for your Python version and architecture on PyPI. If not, manual setup of the build environment is necessary.
4.  Once `lupa` can be installed (i.e., its prerequisites are met), Wiktra can be installed via pip:
    ```bash
    pip install wiktra
    ```

*Note: The original README mentioned that version 2 had not been working well on Ubuntu and Windows 10 at one point. While efforts are made to ensure cross-platform compatibility, installing `lupa` correctly is often the main hurdle. Refer to the `lupa` documentation for specific guidance on its installation.*

**Troubleshooting Installation:**

*   **`LuaError: module 'wikt.mw' not found` or similar Lua errors**: This typically means the Lua runtime cannot find the Wiktionary modules. Wiktra attempts to set the `LUA_PATH` environment variable correctly during runtime. If issues persist, it might indicate a problem with how `lupa` is locating Lua files or an incomplete installation.
*   **`lupa` installation issues**: These are common. Ensure you have a C compiler and the correct Lua (or LuaJIT) development libraries (headers) installed. Consult `lupa`'s documentation and open issues for platform-specific advice. Using virtual environments (e.g., `venv`) is highly recommended.

## Basic Usage

Wiktra offers two main ways to perform transliterations:

### 1. Command-Line Interface (`wiktrapy`)

The `wiktrapy` tool is perfect for quick transliterations or use in shell scripts.

**Basic syntax:**

```bash
wiktrapy [options] -t "Your text here"
# or pipe text into it
echo "Your text here" | wiktrapy [options]
```

**Examples:**

*   **Automatic language/script detection (transliterates to Latin by default):**
    ```bash
    wiktrapy -t "Привет"
    # Expected Output: Privet
    ```
    ```bash
    echo "नमस्ते" | wiktrapy
    # Expected Output: namaste
    ```

*   **Specifying input language and script (for explicit transliteration):**
    ```bash
    wiktrapy -t "Привет" -l ru -s Cyrl
    # Expected Output: Privet
    ```
    Here, `-l ru` specifies Russian and `-s Cyrl` specifies Cyrillic script.

*   **Specifying output script:**
    ```bash
    # This example assumes a module exists for English (Latn) to Cyrillic (Cyrl)
    # wiktrapy -t "Hello" -l en -s Latn -o Cyrl
    ```
    The default output script is `Latn` (Latin).

*   **Listing supported scripts and orthographies:**
    ```bash
    wiktrapy --stats
    ```

*   **Getting help for all options:**
    ```bash
    wiktrapy -h
    ```

### 2. Python Module (`wiktra`)

For more programmatic control, use the `wiktra` Python module. The recommended way is to use the `Transliterator` class.

**Example (New API - Recommended):**

```python
from wiktra.Wiktra import Transliterator

# Create a Transliterator instance
# This is best done once if you're doing multiple transliterations
tr = Transliterator()

# Transliterate text with automatic language/script detection
# (will try to guess input script and use 'und' - undefined language for that script)
text_cyrillic = "Привет мир"
latin_text = tr.tr(text_cyrillic)
print(f"'{text_cyrillic}' -> '{latin_text}'")
# Expected Output: 'Привет мир' -> 'Privet mir'

text_devanagari = "नमस्ते दुनिया"
latin_text_dev = tr.tr(text_devanagari)
print(f"'{text_devanagari}' -> '{latin_text_dev}'")
# Expected Output: 'नमस्ते दुनिया' -> 'namaste duniyaa'

# Explicitly specify language, input script, and output script
text_russian = "Русский текст"
# lang='ru' (Russian), sc='Cyrl' (Cyrillic), to_sc='Latn' (Latin)
transliterated_explicit = tr.tr(text_russian, lang='ru', sc='Cyrl', to_sc='Latn', explicit=True)
print(f"'{text_russian}' (explicit) -> '{transliterated_explicit}'")
# Expected Output: 'Русский текст' (explicit) -> 'Russkij tekst'

# Using the class instance is more efficient for multiple transliterations
# as the Lua runtime and modules are initialized only once.
```

*   If `explicit=True`, you must provide `lang` (input language code, e.g., ISO 639) and `sc` (input script code, e.g., ISO 15924). `to_sc` (output script code) defaults to `Latn` if not specified.
*   If `explicit=False` (the default), Wiktra attempts to guess the input script if `sc` is not provided. It then typically assumes an "undefined" (`und`) language for that script, unless `lang` is also provided.

**Legacy Function (`translite`):**

A legacy `translite` function is also available, primarily for compatibility with older versions of Wiktra or specific use cases that relied on its distinct language code mapping.

```python
from wiktra.Wiktra import translite as tr_legacy

# Example for Mongolian (Cyrillic) using its legacy code 'mon'
mongolian_text = "монгол бичлэг"
transliterated_mongolian = tr_legacy(mongolian_text, 'mon')
print(f"'{mongolian_text}' (legacy) -> '{transliterated_mongolian}'")
# Expected Output: 'монгол бичлэг' (legacy) -> 'mongol bichleg'
```
It is generally recommended to use the new `Transliterator.tr()` method for its more standardized approach to language/script codes and broader capabilities.

## Updating Wiktionary Modules

Wiktra can update its local collection of Wiktionary transliteration modules using the `wiktrapy_update` command:

```bash
wiktrapy_update -h # For options
wiktrapy_update
```
This helps keep your transliterations aligned with the latest rules from Wiktionary.

## Technical Details

This section provides a deeper insight into Wiktra's architecture, its core components, and guidelines for coding and contributing.

### How Wiktra Works

Wiktra's ability to perform complex transliterations stems from its use of Lua modules sourced directly from Wiktionary, executed within a Python environment.

**1. Python-Lua Integration via `lupa`:**
The core of Wiktra's cross-language functionality is the `lupa` library. `lupa` provides a bridge between Python and Lua (specifically designed for LuaJIT, but can work with standard Lua), allowing Python code to:
*   Initialize and manage a Lua runtime environment.
*   Load and execute Lua code, including the Wiktionary transliteration modules.
*   Pass data (like the text to be transliterated and language/script parameters) from Python to Lua functions.
*   Receive results back from Lua functions into Python.

**2. The `Transliterator` Class (`wiktra/Wiktra.py`):**
This is the central class orchestrating transliteration.
*   **Initialization (`__init__`)**: When a `Transliterator` object is created, it:
    *   Initializes a `LuaRuntime` instance from `lupa`.
    *   Loads the mapping between language/script codes and Wiktionary Lua modules from `wiktra/wikt/data/data.json`. This JSON file is key to identifying the correct Lua module for a given transliteration request.
    *   Programmatically configures the `LUA_PATH` environment variable to ensure Lua can locate the necessary modules within the `wiktra/wikt/` directory structure.
*   **Transliteration Method (`tr`)**: This is the primary method for the new API.
    *   **Language/Script Handling**:
        *   If `explicit=True`, it directly uses the provided `lang` (language), `sc` (input script), and `to_sc` (output script).
        *   If `explicit=False` (default), it calls `auto_script_lang` to deduce the input script and language if they are not fully specified.
    *   **`auto_script_lang` Method**: This helper method determines the script of the input text using `fontTools.unicodedata.ucd.script()` if no script is provided. It then uses `langcodes.closest_match()` to find the best matching language/script combination available in Wiktra's supported list (derived from `data.json`) against the (partially) specified or detected input.
    *   **Module Loading and Execution**: Based on the determined language, input script, and target output script, it looks up the appropriate Lua module name (e.g., `ru-translit`, `ar-translit`) from the `mod_map` (loaded from `data.json`). It then constructs and executes a Lua command like `require("wikt.translit.MODULE_NAME").tr("text_to_transliterate", "lang_code", "script_code")`. The result from the Lua function is then returned to Python.
*   **Legacy Method (`tr_legacy`)**: This method supports the older `translite` function's interface. It uses an internal, hardcoded `lang_map` (defined in `Wiktra.py`) to map legacy language codes to Wiktionary module names and script codes before invoking the Lua modules.

**3. Wiktionary Lua Modules (`wiktra/wikt/`):**
This directory and its subdirectories contain the Lua code and data sourced from Wiktionary.
*   **Transliteration Modules (`wiktra/wikt/translit/`)**: These are individual Lua files (e.g., `ru-translit.lua`, `ar-translit.lua`) containing the transliteration rules for specific languages or scripts. Each module typically exposes a `tr(text, lang_code, script_code)` function that Wiktra calls.
*   **Core Lua Dependencies (`wiktra/wikt/mw/`, `wiktra/wikt/mw-*.lua`, etc.)**: These are supporting Lua modules, also from Wiktionary, providing common functionalities (like Unicode string manipulation via `mw.ustring`, message handling, site utilities) that the transliteration modules often depend on. `mwInit.lua` likely initializes this MediaWiki-like Lua environment for the modules.
*   **Data Files (`wiktra/wikt/data/`)**:
    *   `data.json`: The primary mapping used by `Transliterator` to find the correct Lua module for a new API request (maps script -> language -> output_script -> module_info).
    *   `data.yaml`: A human-readable YAML version of the module mappings, also listing the Wiktionary transliteration modules used. Useful for reference and potentially for generation of `data.json`.
    *   Other data files (e.g., within `translit/data/` or language-specific data modules) are used directly by the Lua modules themselves.
    *   `make-data-lang.lua` appears to be a script used in the process of generating or updating language data mappings.

**4. CLI Entry Point (`wiktra/__main__.py`):**
This script powers the `wiktrapy` command-line tool.
*   It uses Python's `argparse` module to define and parse command-line arguments (e.g., `-t` for text, `-l` for language, `-s` for script).
*   It reads input text from the `-t` argument, an input file specified by `-i`, or directly from `stdin` if no text source is given.
*   It instantiates the `Transliterator` class from `wiktra.Wiktra`.
*   It then calls the `tr()` method of the `Transliterator` instance with the processed arguments and prints the transliterated result to standard output.
*   It also handles the `--stats` option to display a list of supported scripts and orthographies by querying the `Transliterator` instance.

**5. Module Update Mechanism (`wiktra/update.py` and `wiktrapy_update`):**
Wiktra includes a built-in mechanism to update its local cache of Wiktionary Lua modules and associated data.
*   The `wiktrapy_update` console script (which calls `main` in `wiktra.update`) manages this process.
*   This involves fetching the latest versions of the Lua modules and data files from Wiktionary (the exact source and methods are implemented in `update.py`). This functionality is crucial for keeping Wiktra's transliteration capabilities current with the ongoing improvements made by the Wiktionary community.

### Coding and Contribution Guidelines

We welcome contributions to Wiktra! Here are some guidelines:

**Coding Style:**

*   **Python:** Please adhere to [PEP 8](https://www.python.org/dev/peps/pep-0008/). Consider using tools like Flake8 for linting and Black or Ruff for formatting to maintain consistency.
*   **Lua:** Aim for clarity and consistency with the existing Lua code style, which originates from Wiktionary.

**Dependencies:**

*   Python dependencies are listed in `requirements.txt` and declared in `setup.py`.
*   When adding or modifying dependencies, ensure these files are updated. Use of virtual environments (e.g., `python -m venv .venv`) is strongly recommended for development.
*   Lua module dependencies are generally bundled within the `wiktra/wikt/` directory.

**Testing:**

*   While a comprehensive, dedicated test suite might not be fully established, testing is vital.
*   Contributions, especially those adding new features or fixing bugs, should ideally be accompanied by tests.
*   Many Wiktionary Lua modules link to their test cases on Wiktionary (e.g., on pages like `Module:xx-translit/testcases`). These can serve as excellent references for expected behavior.
*   When modifying transliteration logic or adding support for new languages/scripts, test with a diverse set of inputs, including common words, special characters, and edge cases.

**Contribution Process:**

1.  **Fork the Repository:** Start by forking the active Wiktra repository (see Project Locations above).
2.  **Create a Branch:** For your changes, create a new branch in your fork (e.g., `feature/add-georgian-translit` or `fix/unicode-error-arabic`).
3.  **Code:** Implement your changes, following the coding style guidelines.
4.  **Test:** Thoroughly test your modifications.
5.  **Commit:** Write clear, descriptive commit messages. A common convention is a short subject line (max 50 characters), a blank line, and then a more detailed explanation if necessary.
6.  **Push:** Push your changes to your branch in your forked repository.
7.  **Create a Pull Request:** Open a pull request against the main branch of the active Wiktra repository. Clearly describe your changes, the problem they solve, and how you tested them.

**Reporting Issues:**

*   Before submitting a new issue, please check the existing issues on GitHub to see if your problem or suggestion has already been reported.
*   If not, create a new issue, providing as much detail as possible:
    *   Wiktra version (`wiktrapy -V`).
    *   Python version.
    *   Operating system and version.
    *   Clear steps to reproduce the bug.
    *   The exact input text, language/script parameters used.
    *   The expected behavior versus the actual behavior or error message.

**License:**

Wiktra is distributed under the [GPLv2 (GNU General Public License version 2)](./LICENSE.txt). All contributions to the project are also expected to be made under this license.

---

This README aims to be a comprehensive guide for both users and developers of Wiktra. For further details, exploring the source code and the linked Wiktionary resources is encouraged.
