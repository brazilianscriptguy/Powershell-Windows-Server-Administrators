<div>
  <h1>🔧 SysAdmin-Tools Suite</h1>
  <p>
    Welcome to the <strong>SysAdmin-Tools</strong> suite! This powerful collection of 
    <strong>PowerShell scripts</strong> is designed to streamline and automate the management of Active Directory (AD), Windows Server roles, 
    network infrastructure, and workstation configurations. These tools simplify complex administrative tasks, enhance operational efficiency, 
    and ensure compliance and security across IT environments.
  </p>

  <hr />

  <h2>🌟 Key Features</h2>
  <ul>
    <li><strong>User-Friendly Interfaces:</strong> All scripts include a GUI for intuitive use.</li>
    <li><strong>Detailed Logging:</strong> Generate <code>.log</code> files for audit trails and troubleshooting.</li>
    <li><strong>Exportable Reports:</strong> Export results in <code>.csv</code> format for reporting and integration with analytics tools.</li>
  </ul>

  <hr />

  <h2>📄 Folder Structure and Categories</h2>
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
        <td><strong>ActiveDirectory-Management</strong></td>
        <td>Tools for managing Active Directory, including user accounts, computer accounts, group policies, and directory synchronization.</td>
        <td>
          <a href="ActiveDirectory-Management/README.md" target="_blank">
            <img src="https://img.shields.io/badge/AD%20Management-README-blue?style=for-the-badge&logo=github" 
            alt="ActiveDirectory-Management README Badge">
          </a>
        </td>
      </tr>
      <tr>
        <td><strong>GroupPolicyObjects-Templates</strong></td>
        <td>A collection of ready-to-use GPO templates designed for seamless import into a new Windows Server Forest and Domain structure.</td>
        <td>
          <a href="GroupPolicyObjects-Templates/README.md" target="_blank">
            <img src="https://img.shields.io/badge/GPO%20Templates-README-blue?style=for-the-badge&logo=github" 
            alt="GPOs-Templates README Badge">
          </a>
        </td>
      </tr>
      <tr>
        <td><strong>Network-and-Infrastructure-Management</strong></td>
        <td>Scripts for managing network services (e.g., DHCP, DNS, WSUS) and ensuring reliable infrastructure operations.</td>
        <td>
          <a href="Network-and-Infrastructure-Management/README.md" target="_blank">
            <img src="https://img.shields.io/badge/Network%20Management-README-blue?style=for-the-badge&logo=github" 
            alt="Network Management README Badge">
          </a>
        </td>
      </tr>
      <tr>
        <td><strong>Security-and-Process-Optimization</strong></td>
        <td>Tools for optimizing system performance, enforcing compliance, and enhancing security.</td>
        <td>
          <a href="Security-and-Process-Optimization/README.md" target="_blank">
            <img src="https://img.shields.io/badge/Security%20Optimization-README-blue?style=for-the-badge&logo=github" 
            alt="Security Optimization README Badge">
          </a>
        </td>
      </tr>
      <tr>
        <td><strong>SystemConfiguration-and-Deployment</strong></td>
        <td>Tools for deploying and configuring software, managing group policies, and maintaining consistent system settings across the domain.</td>
        <td>
          <a href="SystemConfiguration-and-Deployment/README.md" target="_blank">
            <img src="https://img.shields.io/badge/System%20Deployment-README-blue?style=for-the-badge&logo=github" 
            alt="System Deployment README Badge">
          </a>
        </td>
      </tr>
    </tbody>
  </table>

  <hr />

  <h2>🛠️ Prerequisites</h2>
  <ol>
    <li>
      <strong>🖥️ Remote Server Administration Tools (RSAT):</strong>
      <p>Install RSAT components for managing AD, DNS, DHCP, and other server roles.</p>
      <pre><code>Get-WindowsCapability -Name RSAT* -Online | Add-WindowsCapability -Online</code></pre>
    </li>
    <li>
      <strong>⚙️ PowerShell Version:</strong>
      <p>Use PowerShell 5.1 or later. Verify your version:</p>
      <pre><code>$PSVersionTable.PSVersion</code></pre>
    </li>
    <li><strong>🔑 Administrator Privileges:</strong> Scripts require elevated permissions to perform administrative tasks.</li>
    <li>
      <strong>🔧 Execution Policy:</strong>
      <p>Temporarily allow script execution with:</p>
      <pre><code>Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope Process</code></pre>
    </li>
    <li>
      <strong>📦 Dependencies:</strong>
      <p>Ensure all required software components and modules (e.g., <code>ActiveDirectory</code>, <code>DHCPServer</code>) are installed.</p>
    </li>
  </ol>

  <hr />

  <h2>🚀 Getting Started</h2>
  <ol>
      <li>
      <strong>Clone or download the Main Repository:</strong>
      <pre><code>git clone https://github.com/brazilianscriptguy/Windows-SysAdmin-ProSuite.git</code></pre>
    </li>
    <li>
      <strong>Navigate to the Repository Folder:</strong>
      <p>Navigate to the <code>Windows-SysAdmin-ProSuite/SysAdmin-Tools/</code> directory that contains the desired scripts.</p>
    </li>
    <li>
      <strong>Review Documentation:</strong>
      <p>Open the <code>README.md</code> file in the chosen subfolder for detailed script descriptions and usage instructions.</p>
    </li>
    <li>
      <strong>Run the Script:</strong>
      <p>Execute the desired PowerShell script with the following command:</p>
      <pre><code>.\ScriptName.ps1</code></pre>
    </li>
    <li>
      <strong>Verify Logs and Reports:</strong>
      <p>Check the generated <code>.log</code> files for details on script execution and exported <code>.csv</code> files for results.</p>
    </li>
  </ol>

  <hr />

  <h2>📝 Logging and Reporting</h2>
  <ul>
    <li><strong>Logs:</strong> Each script generates <code>.log</code> files for tracking operations and debugging.</li>
    <li><strong>Reports:</strong> Many scripts export results in <code>.csv</code> format for reporting and analysis.</li>
  </ul>

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
