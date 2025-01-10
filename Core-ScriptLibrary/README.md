<div>
  <h1>📂 Core-ScriptLibrary Folder</h1>
  <p>
    Welcome to the <strong>Core-ScriptLibrary</strong>! This collection includes essential 
    <strong>PowerShell scripts</strong> designed to simplify the creation, execution, and management of custom script libraries. 
    By focusing on dynamic user interfaces, automation, and robust functionality, these tools provide a solid foundation for building efficient and maintainable PowerShell-based solutions.
  </p>

  <hr />

  <h2>📄 Overview</h2>
  <p>
    The <strong>Core-ScriptLibrary</strong> provides reusable templates and automation tools that help administrators standardize their PowerShell workflows. From creating consistent script headers to automating GUI-based script execution, these tools are essential for efficient script development and management.
  </p>
  <ul>
    <li><strong>User-Friendly GUIs:</strong> Enhance user interaction with intuitive graphical interfaces.</li>
    <li><strong>Standardized Logging:</strong> Maintain consistent, traceable logs for improved debugging and auditing.</li>
    <li><strong>Exportable Results:</strong> Generate actionable <code>.csv</code> outputs for streamlined analysis and reporting.</li>
    <li><strong>Efficient Automation:</strong> Quickly build and deploy PowerShell libraries with reusable templates.</li>
  </ul>

  <hr />

  <h2>📂 Folder Structure</h2>
  <table border="1" style="border-collapse: collapse; width: 100%; text-align: left;">
    <thead>
      <tr>
        <th style="padding: 8px;">Folder Name</th>
        <th style="padding: 8px;">Description</th>
        <th style="padding: 8px;">Folder Link</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td><strong>ScriptTemplates</strong></td>
        <td>Contains reusable templates for creating consistent PowerShell scripts with standardized headers and logging mechanisms.</td>
        <td>
          <a href="ScriptTemplates/README.md" target="_blank">
            <img src="https://img.shields.io/badge/Script%20Templates-README-blue?style=for-the-badge&logo=github" 
            alt="Script Templates README Badge">
          </a>
        </td>
      </tr>
      <tr>
        <td><strong>ExecutionTools</strong></td>
        <td>Tools for executing and managing PowerShell scripts through GUI-based interfaces and dynamic menus.</td>
        <td>
          <a href="ExecutionTools/README.md" target="_blank">
            <img src="https://img.shields.io/badge/Execution%20Tools-README-blue?style=for-the-badge&logo=github" 
            alt="Execution Tools README Badge">
          </a>
        </td>
      </tr>
      <tr>
        <td><strong>HeaderExtractors</strong></td>
        <td>Scripts to extract and document PowerShell script headers for organized documentation and review.</td>
        <td>
          <a href="HeaderExtractors/README.md" target="_blank">
            <img src="https://img.shields.io/badge/Header%20Extractors-README-blue?style=for-the-badge&logo=github" 
            alt="Header Extractors README Badge">
          </a>
        </td>
      </tr>
    </tbody>
  </table>

  <hr />

  <h2>📄 Script Descriptions</h2>
  <table border="1" style="border-collapse: collapse; width: 100%; text-align: left;">
    <thead>
      <tr>
        <th style="padding: 8px;">Script Name</th>
        <th style="padding: 8px;">Description</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td><strong>Create-Script-DefaultHeader.ps1</strong></td>
        <td>Generates standardized headers for PowerShell scripts, ensuring uniformity and best practices.</td>
      </tr>
      <tr>
        <td><strong>Create-Script-LoggingMethod.ps1</strong></td>
        <td>Implements a standardized logging mechanism to enhance traceability and debugging.</td>
      </tr>
      <tr>
        <td><strong>Create-Script-MainStructure-Core.ps1</strong></td>
        <td>Provides a reusable template for creating structured PowerShell scripts with headers, logging, and modular functionality.</td>
      </tr>
      <tr>
        <td><strong>Extract-Script-Headers.ps1</strong></td>
        <td>Extracts headers from <code>.ps1</code> files and organizes them into folder-specific <code>.txt</code> files for easy documentation.</td>
      </tr>
      <tr>
        <td><strong>Launch-Script-AutomaticMenu.ps1</strong></td>
        <td>Serves as a dynamic GUI launcher for browsing and executing PowerShell scripts organized in folder tabs.</td>
      </tr>
    </tbody>
  </table>

  <hr />

  <h2>🚀 Usage Instructions</h2>
  <ol>
    <li>
      <strong>Create-Script-DefaultHeader.ps1:</strong>
      <p>Run the script and provide inputs for author, version, and description. Copy the generated header into your PowerShell scripts.</p>
    </li>
    <li>
      <strong>Create-Script-LoggingMethod.ps1:</strong>
      <p>Integrate the provided logging function into your scripts. Specify log file paths for consistent traceability. Use logs to review events, errors, and debugging information.</p>
    </li>
    <li>
      <strong>Create-Script-MainStructure-Core.ps1:</strong>
      <p>Use the provided template as the foundation for your PowerShell projects. Customize the core functionalities and logging as needed.</p>
    </li>
    <li>
      <strong>Extract-Script-Headers.ps1:</strong>
      <p>Specify a root folder containing <code>.ps1</code> files. Run the script to extract headers and save them into categorized <code>.txt</code> files.</p>
    </li>
    <li>
      <strong>Launch-Script-AutomaticMenu.ps1:</strong>
      <p>Place the <code>Launch-Script-AutomaticMenu.ps1</code> in the root directory containing your PowerShell scripts. Use the intuitive GUI to browse folders and execute your scripts effortlessly.</p>
    </li>
  </ol>

  <hr />

  <h2>📝 Logging and Reporting</h2>
  <ul>
    <li><strong>Logs:</strong> Scripts generate <code>.log</code> files that document executed actions and errors encountered.</li>
    <li><strong>Reports:</strong> Some scripts produce <code>.csv</code> files for detailed analysis and auditing.</li>
  </ul>

  <hr />

  <h2>💡 Tips for Optimization</h2>
  <ul>
    <li><strong>Automate Execution:</strong> Schedule your scripts to run periodically for consistent results.</li>
    <li><strong>Centralize Logs and Reports:</strong> Save <code>.log</code> and <code>.csv</code> files in shared directories for collaborative analysis.</li>
    <li><strong>Customize Templates:</strong> Tailor script templates to align with your specific workflows and organizational needs.</li>
  </ul>

  <hr />

  <p>
    Explore the <strong>Core-ScriptLibrary</strong> and streamline your PowerShell scripting experience. These tools are crafted to make creating, managing, and automating workflows a breeze. Enjoy! 🎉
  </p>

  <hr />

  <h2>❓ Additional Assistance</h2>
  <p>
    These scripts are fully customizable to fit your unique requirements. For more information on setup or assistance with specific tools, refer to the included <code>README.md</code> or the detailed documentation available in each subfolder.
  </p>

  <div align="center">
    <a href="mailto:luizhamilton.lhr@gmail.com" target="_blank" rel="noopener noreferrer">
      <img src="https://img.shields.io/badge/Email-luizhamilton.lhr@gmail.com-D14836?style=for-the-badge&logo=gmail" alt="Email Badge">
    </a>
    <a href="https://www.patreon.com/c/brazilianscriptguy" target="_blank" rel="noopener noreferrer">
      <img src="https://img.shields.io/badge/Support%20Me-Patreon-red?style=for-the-badge&logo=patreon" alt="Support on Patreon Badge">
    </a>
    <a href="https://whatsapp.com/channel/0029VaEgqC50G0XZV1k4Mb1c" target="_blank" rel="noopener noreferrer">
      <img src="https://img.shields.io/badge/Join%20Us-WhatsApp-25D366?style=for-the-badge&logo=whatsapp" alt="WhatsApp Badge">
    </a>
    <a href="https://github.com/brazilianscriptguy/BlueTeam-Tools/issues" target="_blank" rel="noopener noreferrer">
      <img src="https://img.shields.io/badge/Report%20Issues-GitHub-blue?style=for-the-badge&logo=github" alt="GitHub Issues Badge">
    </a>
  </div>
</div>
