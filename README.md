# 🎓 FCSE Skopje Master Thesis LaTeX Template (Macedonian/English)

This repository provides the **definitive, modern, and fully configured LaTeX template** for seamlessly writing your Master's Thesis at the Faculty of Computer Science and Engineering (FCSE), UKIM Skopje. Designed for clarity and strict adherence to official formatting requirements.

## ✨ Key Features & Highlights

| Feature | Description | Benefit |
| :--- | :--- | :--- |
| **🇲🇰 Full Cyrillic Support** | Implements the official **Macedonian Cyrillic** character set and hyphenation. | Flawless handling of technical Macedonian text. |
| **🌐 Multilingual Ready** | Secondary language support for **English** via `polyglossia`. | Ideal for multilingual abstracts and appendices. |
| **📐 FCSE Compliant** | Predefined structure including Title Page, Abstract, ToC, LoF, and LoT. | Spend zero time on formatting, maximum time on research. |
| **💡 Binding Optimized** | Margins are intentionally uneven, optimized for **hard-cover binding**. | Guarantees perfect alignment in your printed thesis. |
| **⚙️ Compiler** | Built for **XeLaTeX** (Unicode-native). | Best compatibility for Cyrillic typography and modern font usage. |
| **☁️ Platform Ready** | Works flawlessly on **Overleaf** or any local TeX distribution. | Start writing anywhere, anytime. |

-----

## 🛠️ Getting Started

### Project Structure

The repository is organized for easy access and extension:

```
fcse-skopje-master-thesis-template/
├── main_tex.tex       # Primary thesis file
├── csthes.cls         # Custom FCSE class file (do not modify)
├── chapters/          # 📄 Place your thesis chapters here
├── images/            # 🖼️ Repository for all figures
├── appendix/          # 📝 Optional appendix material
├── mybib.bib          # 📚 Your BibTeX reference file
└── README.md
```

### ⚙️ How to Compile (The Four Steps)

The template is configured for **XeLaTeX**. Choose your preferred method:

#### 1\. Recommended: Command Line (Local TeX Distro)

Run the commands below sequentially to ensure all references (ToC, Bibliography, etc.) are resolved:

```bash
xelatex main_tex.tex
bibtex main_tex
xelatex main_tex.tex
xelatex main_tex.tex
```

#### 2\. Alternative: `latexmk`

For a single-command solution:

```bash
latexmk -xelatex main_tex.tex
```

#### 3\. Overleaf Users ☁️

1.  Upload the entire folder contents to a new Overleaf project.
2.  Go to **Menu** → **Settings** → Set the **Compiler** to **XeLaTeX**.
3.  Click Recompile.

-----

## 📝 Customization Guide

### Adding Chapters

To include a chapter in your thesis, ensure your `.tex` file is inside the `/chapters` directory, then use the `\input` command in `main_tex.tex`:

```tex
% main_tex.tex snippet
\input{chapters/introduction} % Example: introduction.tex
\input{chapters/second_chapter} % Add your new chapters here
```

### Inserting Images

Place your image files (e.g., `.png`, `.jpg`, `.pdf`) inside the `/images` folder.

```tex
\begin{figure}[h!]
    \centering
    % [width=0.75\textwidth] ensures the image scales relative to the text width
    \includegraphics[width=0.75\textwidth]{images/figure_name} 
    \caption{Descriptive figure caption}
\end{figure}
```

### Bibliography

  * Add all your references in BibTeX format to the **`mybib.bib`** file.
  * Cite sources within your text using standard LaTeX commands, e.g., `\cite{reference_key}`.

-----

## ✒️ Typography & Credits

### Typeface Used

This template proudly features the **SkolaSans** font family by **Lasko Džurovski**.

  * **Free font download:** [https://www.behance.net/gallery/17504367/Free-font-family-SkolaSans](https://www.behance.net/gallery/17504367/Free-font-family-SkolaSans)

All credit for the font's design and creation belongs solely to its original author.

### Template Author

This LaTeX template was prepared and published by **Emilija Gjorgjevska**, MSc candidate at FCSE, UKIM. Emilija's research focuses on the intersection of AI, knowledge graphs, and large-scale digital ecosystems.

-----

## 🤝 Contributions & License

### License

This project is released under the **MIT License**. You are free to reuse, modify, and distribute this template, provided attribution is maintained.

### Contributions Welcome\!

We welcome suggestions and improvements\! If you find a bug, have a formatting suggestion, or want to add a useful feature, please feel free to:

1.  Open an **Issue**.
2.  Submit a **Pull Request**.
