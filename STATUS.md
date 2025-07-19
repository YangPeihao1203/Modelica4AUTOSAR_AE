# Artifact Submission Status

## 🎖 Applied Badges

- ✅ Artifact Evaluated – Functional  
- ✅ Artifact Evaluated – Reusable
## Artifact Evaluated - Functional

We justify that the artifact meets the **Functional** badge requirements based on the following observations:

- ✅ **Complete Library Structure**: The repository includes a fully organized and encapsulated AUTOSAR Application Layer Modeling Library built in Modelica. The structure follows a clean folder organization (`M2/`) with submodules such as `VisibleElements`, `Examples`, `Utilities`, `AUTOSAR Templates`, and `MSR`, which collectively enable end-to-end visual modeling.

- ✅ **Executable Examples**: The `Examples/` folder provides ten modeling and simulation cases covering automotive, electrical, and mechanical domains. Each example is directly executable in both commercial (MWorks Sysplorer) and open-source (OpenModelica) environments, as supported by the screenshots and configuration notes in `EXAMPLES.md`.

- ✅ **Reproducibility Instructions**: The repository includes detailed steps for setting up the environment, running simulations, and validating output (see `REQUIREMENTS.md`, `EXAMPLES.md`, and inline comments in the models).

- ✅ **Simulation Evidence**: Time-cost logs and simulation results (screenshots) are provided under `time-cost-logs/`, clearly demonstrating that the models function as described in the paper.

These points confirm that the artifact operates as described and can be used to reproduce the results reported in the paper.

---

## Artifact Evaluated - Reusable

We justify that the artifact satisfies the **Reusable** badge requirements based on the following features:

- 🧩 **Well-Structured, Documented Modules**: The library is modular and organized with AUTOSAR modeling principles in mind. The presence of `AUTOSAR Templates/` (e.g., `SWComponentTemplate.mo`, `GenericStructure.mo`) and `Utilities/` enables easy customization and extension by others.

- 📚 **Example-Rich Repository**: The `Examples/` directory not only demonstrates functionality but also serves as a reference for building new use cases. Each example comes with concise descriptions and configuration notes in `EXAMPLES.md`.

- 📖 **Documentation Entry Point Provided**: The repository includes a `README.md` file that serves as the primary entry point for users, providing an overview of the repository structure, modeling philosophy, and usage instructions.

- ⚙️ **Environment-Agnostic Execution**: By supporting both OpenModelica and MWorks, the artifact maximizes compatibility and encourages reuse across different toolchains.

- 📖 **Clear Requirements and Dependencies**: `REQUIREMENTS.md` provides all necessary environment specifications, including required Modelica tools and simulation settings, lowering the entry barrier for reuse.

- 🛠️ **Ease of Integration**: Visual modeling support through `VisibleElements/` enables drag-and-drop integration in graphical environments, making the artifact developer-friendly.

These characteristics ensure that future researchers and practitioners can build upon the artifact with minimal effort, meeting the criteria for reusability.

---

We aim to promote not only reproducibility, but also reusability of our work for both academic and industrial applications.



We sincerely thank the Artifact Evaluation committee for their time and valuable feedback.
