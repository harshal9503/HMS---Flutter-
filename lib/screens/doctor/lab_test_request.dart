import 'package:flutter/material.dart';
import 'package:hms/utils/constants.dart';

class LabTestRequest extends StatefulWidget {
  const LabTestRequest({super.key});

  @override
  State<LabTestRequest> createState() => _LabTestRequestState();
}

class _LabTestRequestState extends State<LabTestRequest> {
  String _selectedFilter = 'All';
  String _selectedPriority = 'All';
  String _selectedStatus = 'All';
  final TextEditingController _searchController = TextEditingController();
  final List<Map<String, dynamic>> _testRequests = [
    {
      'testName': 'Lipid profile',
      'category': 'Hematology',
      'patient': 'John Smith',
      'date': '12/01/2025',
      'priority': 'Urgent',
      'status': 'Completed',
    },
    {
      'testName': 'Lipid profile',
      'category': 'Hematology',
      'patient': 'John Smith',
      'date': '12/01/2025',
      'priority': 'Routine',
      'status': 'Completed',
    },
    {
      'testName': 'Lipid profile',
      'category': 'Hematology',
      'patient': 'John Smith',
      'date': '12/01/2025',
      'priority': 'Routine',
      'status': 'Completed',
    },
    {
      'testName': 'Lipid profile',
      'category': 'Hematology',
      'patient': 'John Smith',
      'date': '12/01/2025',
      'priority': 'Urgent',
      'status': 'Waiting',
    },
    {
      'testName': 'Lipid profile',
      'category': 'Hematology',
      'patient': 'John Smith',
      'date': '12/01/2025',
      'priority': 'Routine',
      'status': 'Completed',
    },
    {
      'testName': 'Lipid profile',
      'category': 'Hematology',
      'patient': 'John Smith',
      'date': '12/01/2025',
      'priority': 'Routine',
      'status': 'Completed',
    },
    {
      'testName': 'Lipid profile',
      'category': 'Hematology',
      'patient': 'John Smith',
      'date': '12/01/2025',
      'priority': 'Routine',
      'status': 'Completed',
    },
  ];

  List<Map<String, dynamic>> get _filteredRequests {
    return _testRequests.where((request) {
      bool filterMatch =
          _selectedFilter == 'All' || request['testName'] == _selectedFilter;
      bool priorityMatch = _selectedPriority == 'All' ||
          request['priority'] == _selectedPriority;
      bool statusMatch =
          _selectedStatus == 'All' || request['status'] == _selectedStatus;
      bool searchMatch = _searchController.text.isEmpty ||
          request['testName']
              .toLowerCase()
              .contains(_searchController.text.toLowerCase()) ||
          request['patient']
              .toLowerCase()
              .contains(_searchController.text.toLowerCase()) ||
          request['category']
              .toLowerCase()
              .contains(_searchController.text.toLowerCase());
      return filterMatch && priorityMatch && statusMatch && searchMatch;
    }).toList();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 768;
    final isTablet = screenWidth >= 768 && screenWidth < 1024;

    return Scaffold(
      backgroundColor: const Color(0xFFF7FAFC),
      body: SafeArea(
        child: Column(
          children: [
            // Top Bar - AppBar style
            Container(
              height: 70,
              color: const Color(0xFF2383E2),
              padding: EdgeInsets.symmetric(
                horizontal: isMobile
                    ? 8
                    : isTablet
                        ? 16
                        : 20,
              ),
              child: Row(
                children: [
                  // Back Button
                  Container(
                    width: 50,
                    alignment: Alignment.centerLeft,
                    child: IconButton(
                      icon: const Icon(Icons.arrow_back,
                          color: Colors.white, size: 24),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),

                  // Title
                  const Expanded(
                    child: Text(
                      'Lab Test Request',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),

                  // Voice assistance pill (only for desktop)
                  if (!isMobile && !isTablet)
                    Container(
                      height: 44,
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(999),
                        border:
                            Border.all(color: Colors.white.withOpacity(0.3)),
                      ),
                      child: Row(
                        children: [
                          Container(
                            width: 32,
                            height: 32,
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(
                              Icons.mic_none_rounded,
                              size: 18,
                              color: Color(0xFF2383E2),
                            ),
                          ),
                          const SizedBox(width: 10),
                          const Text(
                            'Voice assistance',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                ],
              ),
            ),

            // Main Content Area
            Expanded(
              child: _buildMainContent(isMobile, isTablet),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMainContent(bool isMobile, bool isTablet) {
    return Container(
      color: const Color(0xFFF7FAFC),
      child: Column(
        children: [
          // Greeting and date section
          Container(
            height: 70,
            color: Colors.white,
            padding: EdgeInsets.symmetric(
              horizontal: isMobile
                  ? 16
                  : isTablet
                      ? 24
                      : 30,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Greeting and date
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Good morning, Dr. Anderson',
                        style: TextStyle(
                          fontSize: isMobile ? 16 : 18,
                          fontWeight: FontWeight.w600,
                          color: const Color(0xFF2D3748),
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Today 24 Dec., Monday',
                        style: TextStyle(
                          fontSize: isMobile ? 12 : 14,
                          color: const Color(0xFF718096),
                        ),
                      ),
                    ],
                  ),
                ),

                // Add new staff button (only on desktop/tablet)
                if (!isMobile)
                  Container(
                    height: 44,
                    child: ElevatedButton.icon(
                      onPressed: () {
                        _showAddTestRequestForm();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF2383E2),
                        padding: EdgeInsets.symmetric(
                          horizontal: isTablet ? 16 : 20,
                          vertical: 12,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        elevation: 0,
                      ),
                      icon: const Icon(
                        Icons.add,
                        size: 20,
                        color: Colors.white,
                      ),
                      label: Text(
                        'Add new staff',
                        style: TextStyle(
                          fontSize: isTablet ? 13 : 14,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),

          // Divider
          Container(height: 1, color: const Color(0xFFE2E8F0)),

          // Main Content
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.all(
                  isMobile
                      ? 16
                      : isTablet
                          ? 20
                          : 24,
                ),
                child: _buildContent(isMobile, isTablet),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContent(bool isMobile, bool isTablet) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Header with breadcrumb and add button for mobile
        if (isMobile) ...[
          const Text(
            'CLINICAL RECORDS >> Lab Test Request',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Color(0xFF718096),
            ),
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Add new staff button for mobile
              Expanded(
                child: Container(
                  margin: const EdgeInsets.only(right: 8),
                  child: ElevatedButton.icon(
                    onPressed: () {
                      _showAddTestRequestForm();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF2383E2),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 8,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6),
                      ),
                      elevation: 0,
                    ),
                    icon: const Icon(
                      Icons.add,
                      size: 14,
                      color: Colors.white,
                    ),
                    label: const Text(
                      'Add new staff',
                      style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],

        // Desktop header
        if (!isMobile)
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'CLINICAL RECORDS >> Lab Test Request',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF718096),
                ),
              ),
            ],
          ),

        const SizedBox(height: 20),

        // STATS CARDS SECTION
        _buildStatsCards(isMobile, isTablet),

        const SizedBox(height: 20),

        // Test Request Management Section
        Container(
          width: double.infinity,
          padding: EdgeInsets.all(isMobile ? 16 : 20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.1),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Staff members',
                style: TextStyle(
                  fontSize: isMobile ? 16 : 18,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFF2D3748),
                ),
              ),
              const SizedBox(height: 16),

              // Search and Filter Row - ALL IN ONE ROW
              _buildSearchFilterRow(isMobile, isTablet),
              const SizedBox(height: 20),

              // Test Requests List/Table
              if (isMobile)
                _buildMobileTestRequestsList()
              else
                _buildDesktopTestRequestsTable(isTablet),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildSearchFilterRow(bool isMobile, bool isTablet) {
    if (isMobile) {
      return Column(
        children: [
          // Search Bar (larger for mobile)
          Container(
            height: 44,
            decoration: BoxDecoration(
              color: const Color(0xFFF7FAFC),
              borderRadius: BorderRadius.circular(6),
              border: Border.all(color: const Color(0xFFE2E8F0)),
            ),
            child: Row(
              children: [
                const SizedBox(width: 12),
                const Icon(Icons.search, size: 20, color: Color(0xFF718096)),
                const SizedBox(width: 8),
                Expanded(
                  child: TextField(
                    controller: _searchController,
                    decoration: const InputDecoration(
                      hintText: 'Search',
                      border: InputBorder.none,
                      hintStyle: TextStyle(color: Color(0xFFA0AEC0)),
                      contentPadding: EdgeInsets.zero,
                    ),
                    style: const TextStyle(
                      fontSize: 14,
                      color: Color(0xFF2D3748),
                    ),
                    onChanged: (value) {
                      setState(() {});
                    },
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),

          // Filter dropdowns in a row for mobile
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                _buildFilterDropdown('All', _selectedFilter, (value) {
                  setState(() {
                    _selectedFilter = value!;
                  });
                }, ['All', 'Lipid profile'], isMobile),
                const SizedBox(width: 8),
                _buildFilterDropdown('Priority', _selectedPriority, (value) {
                  setState(() {
                    _selectedPriority = value!;
                  });
                }, ['All', 'Urgent', 'Routine'], isMobile),
                const SizedBox(width: 8),
                _buildFilterDropdown('Status', _selectedStatus, (value) {
                  setState(() {
                    _selectedStatus = value!;
                  });
                }, ['All', 'Completed', 'Waiting'], isMobile),
              ],
            ),
          ),
          const SizedBox(height: 12),

          // Action Buttons for mobile
          Row(
            children: [
              Expanded(
                child: ElevatedButton.icon(
                  onPressed: () {
                    _showAddTestRequestForm();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF2383E2),
                    padding: const EdgeInsets.symmetric(
                      vertical: 10,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6),
                    ),
                  ),
                  icon: const Icon(
                    Icons.add,
                    size: 16,
                    color: Colors.white,
                  ),
                  label: const Text(
                    'Request new test',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: ElevatedButton.icon(
                  onPressed: () {
                    _deleteSelectedTests();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFF56565),
                    padding: const EdgeInsets.symmetric(
                      vertical: 10,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6),
                    ),
                  ),
                  icon: const Icon(
                    Icons.delete_outline,
                    size: 16,
                    color: Colors.white,
                  ),
                  label: const Text(
                    'Delete',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      );
    } else {
      // Desktop/Tablet layout
      return Column(
        children: [
          Row(
            children: [
              // Search Bar (larger size)
              Expanded(
                flex: 2,
                child: Container(
                  height: 40,
                  decoration: BoxDecoration(
                    color: const Color(0xFFF7FAFC),
                    borderRadius: BorderRadius.circular(6),
                    border: Border.all(color: const Color(0xFFE2E8F0)),
                  ),
                  child: Row(
                    children: [
                      const SizedBox(width: 12),
                      const Icon(Icons.search,
                          size: 20, color: Color(0xFF718096)),
                      const SizedBox(width: 8),
                      Expanded(
                        child: TextField(
                          controller: _searchController,
                          decoration: const InputDecoration(
                            hintText: 'Search',
                            border: InputBorder.none,
                            hintStyle: TextStyle(color: Color(0xFFA0AEC0)),
                            contentPadding: EdgeInsets.zero,
                          ),
                          style: const TextStyle(
                            fontSize: 14,
                            color: Color(0xFF2D3748),
                          ),
                          onChanged: (value) {
                            setState(() {});
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 12),

              // Filter dropdowns
              Expanded(
                child: _buildFilterDropdown('All', _selectedFilter, (value) {
                  setState(() {
                    _selectedFilter = value!;
                  });
                }, ['All', 'Lipid profile'], isMobile),
              ),
              const SizedBox(width: 12),

              Expanded(
                child: _buildFilterDropdown('Priority', _selectedPriority,
                    (value) {
                  setState(() {
                    _selectedPriority = value!;
                  });
                }, ['All', 'Urgent', 'Routine'], isMobile),
              ),
              const SizedBox(width: 12),

              Expanded(
                child: _buildFilterDropdown('Status', _selectedStatus, (value) {
                  setState(() {
                    _selectedStatus = value!;
                  });
                }, ['All', 'Completed', 'Waiting'], isMobile),
              ),
              const SizedBox(width: 12),

              // Action Buttons
              SizedBox(
                width: isTablet ? 140 : 160,
                child: ElevatedButton.icon(
                  onPressed: () {
                    _showAddTestRequestForm();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF2383E2),
                    padding: EdgeInsets.symmetric(
                      horizontal: isTablet ? 12 : 16,
                      vertical: 10,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6),
                    ),
                  ),
                  icon: const Icon(
                    Icons.add,
                    size: 16,
                    color: Colors.white,
                  ),
                  label: Text(
                    'Request new test',
                    style: TextStyle(
                      fontSize: isTablet ? 11 : 12,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 12),

              SizedBox(
                width: isTablet ? 100 : 120,
                child: ElevatedButton.icon(
                  onPressed: () {
                    _deleteSelectedTests();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFF56565),
                    padding: EdgeInsets.symmetric(
                      horizontal: isTablet ? 12 : 16,
                      vertical: 10,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6),
                    ),
                  ),
                  icon: const Icon(
                    Icons.delete_outline,
                    size: 16,
                    color: Colors.white,
                  ),
                  label: Text(
                    'Delete',
                    style: TextStyle(
                      fontSize: isTablet ? 11 : 12,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      );
    }
  }

  Widget _buildFilterDropdown(
    String hint,
    String value,
    Function(String?) onChanged,
    List<String> items,
    bool isMobile,
  ) {
    return Container(
      height: 40,
      decoration: BoxDecoration(
        color: const Color(0xFFF7FAFC),
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: const Color(0xFFE2E8F0)),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: DropdownButton<String>(
        value: value,
        icon: const Icon(Icons.arrow_drop_down,
            size: 20, color: Color(0xFF718096)),
        iconSize: 16,
        elevation: 16,
        style: TextStyle(
          fontSize: isMobile ? 12 : 13,
          color: const Color(0xFF2D3748),
        ),
        underline: const SizedBox(),
        isExpanded: true,
        onChanged: onChanged,
        items: items.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
        hint: Text(
          hint,
          style: TextStyle(
            fontSize: isMobile ? 12 : 13,
            color: const Color(0xFF718096),
          ),
        ),
      ),
    );
  }

  Widget _buildDesktopTestRequestsTable(bool isTablet) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Container(
        constraints: BoxConstraints(
          minWidth: MediaQuery.of(context).size.width - 48,
        ),
        child: DataTable(
          columnSpacing: isTablet ? 16.0 : 24.0,
          headingRowHeight: 50,
          headingRowColor: MaterialStateProperty.all(const Color(0xFFF7FAFC)),
          headingTextStyle: TextStyle(
            fontSize: isTablet ? 11 : 12,
            fontWeight: FontWeight.w600,
            color: const Color(0xFF4A5568),
          ),
          dataRowHeight: 60,
          columns: [
            DataColumn(
                label: SizedBox(
                    width: isTablet ? 120 : 150,
                    child: const Text('Test name'))),
            DataColumn(
                label: SizedBox(
                    width: isTablet ? 100 : 120,
                    child: const Text('Category'))),
            DataColumn(
                label: SizedBox(
                    width: isTablet ? 100 : 120, child: const Text('Patient'))),
            DataColumn(
                label: SizedBox(
                    width: isTablet ? 80 : 100, child: const Text('Date'))),
            DataColumn(
                label: SizedBox(
                    width: isTablet ? 80 : 100, child: const Text('Priority'))),
            DataColumn(
                label: SizedBox(
                    width: isTablet ? 80 : 100, child: const Text('Status'))),
            DataColumn(
                label: SizedBox(
                    width: isTablet ? 200 : 220, child: const Text('Action'))),
          ],
          rows: _filteredRequests.map((request) {
            return DataRow(
              cells: [
                DataCell(
                  SizedBox(
                    width: isTablet ? 120 : 150,
                    child: Text(
                      request['testName'],
                      style: TextStyle(
                        fontSize: isTablet ? 11 : 12,
                        color: const Color(0xFF2D3748),
                      ),
                    ),
                  ),
                ),
                DataCell(
                  SizedBox(
                    width: isTablet ? 100 : 120,
                    child: Text(
                      request['category'],
                      style: TextStyle(
                        fontSize: isTablet ? 11 : 12,
                        color: const Color(0xFF2D3748),
                      ),
                    ),
                  ),
                ),
                DataCell(
                  SizedBox(
                    width: isTablet ? 100 : 120,
                    child: Text(
                      request['patient'],
                      style: TextStyle(
                        fontSize: isTablet ? 11 : 12,
                        color: const Color(0xFF2D3748),
                      ),
                    ),
                  ),
                ),
                DataCell(
                  SizedBox(
                    width: isTablet ? 80 : 100,
                    child: Text(
                      request['date'],
                      style: TextStyle(
                        fontSize: isTablet ? 11 : 12,
                        color: const Color(0xFF718096),
                      ),
                    ),
                  ),
                ),
                DataCell(
                  SizedBox(
                    width: isTablet ? 80 : 100,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: _getPriorityColor(request['priority'])
                            .withOpacity(0.1),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        request['priority'],
                        style: TextStyle(
                          fontSize: isTablet ? 9 : 10,
                          color: _getPriorityColor(request['priority']),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ),
                DataCell(
                  SizedBox(
                    width: isTablet ? 80 : 100,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color:
                            _getStatusColor(request['status']).withOpacity(0.1),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        request['status'],
                        style: TextStyle(
                          fontSize: isTablet ? 9 : 10,
                          color: _getStatusColor(request['status']),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ),
                DataCell(
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    width: isTablet ? 200 : 220,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // View Button - Icon only
                        Container(
                          height: 28,
                          margin: const EdgeInsets.only(right: 6),
                          child: IconButton(
                            onPressed: () => _viewTestRequest(request),
                            icon: Icon(
                              Icons.visibility,
                              size: 16,
                              color: const Color(0xFF38A169),
                            ),
                            style: IconButton.styleFrom(
                              padding: const EdgeInsets.all(6),
                              backgroundColor:
                                  const Color(0xFF38A169).withOpacity(0.1),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(6),
                                side: BorderSide(
                                  color:
                                      const Color(0xFF38A169).withOpacity(0.3),
                                  width: 1,
                                ),
                              ),
                            ),
                          ),
                        ),

                        // Download Button - Icon only
                        Container(
                          height: 28,
                          margin: const EdgeInsets.only(right: 6),
                          child: IconButton(
                            onPressed: () => _downloadTestReport(request),
                            icon: Icon(
                              Icons.download,
                              size: 16,
                              color: const Color(0xFF2383E2),
                            ),
                            style: IconButton.styleFrom(
                              padding: const EdgeInsets.all(6),
                              backgroundColor:
                                  const Color(0xFF2383E2).withOpacity(0.1),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(6),
                                side: BorderSide(
                                  color:
                                      const Color(0xFF2383E2).withOpacity(0.3),
                                  width: 1,
                                ),
                              ),
                            ),
                          ),
                        ),

                        // Call Button - Icon only
                        Container(
                          height: 28,
                          child: IconButton(
                            onPressed: () => _callPatient(request),
                            icon: Icon(
                              Icons.call,
                              size: 16,
                              color: const Color(0xFFED8936),
                            ),
                            style: IconButton.styleFrom(
                              padding: const EdgeInsets.all(6),
                              backgroundColor:
                                  const Color(0xFFED8936).withOpacity(0.1),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(6),
                                side: BorderSide(
                                  color:
                                      const Color(0xFFED8936).withOpacity(0.3),
                                  width: 1,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          }).toList(),
        ),
      ),
    );
  }

  Widget _buildMobileTestRequestsList() {
    return Column(
      children: _filteredRequests.map((request) {
        return Container(
          margin: const EdgeInsets.only(bottom: 12),
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: const Color(0xFFF7FAFC),
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: const Color(0xFFE2E8F0)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    request['testName'],
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF2D3748),
                    ),
                  ),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color:
                          _getStatusColor(request['status']).withOpacity(0.1),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      request['status'],
                      style: TextStyle(
                        fontSize: 10,
                        color: _getStatusColor(request['status']),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Category: ${request['category']}',
                          style: const TextStyle(
                            fontSize: 12,
                            color: Color(0xFF718096),
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          'Patient: ${request['patient']}',
                          style: const TextStyle(
                            fontSize: 12,
                            color: Color(0xFF718096),
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          'Date: ${request['date']}',
                          style: const TextStyle(
                            fontSize: 12,
                            color: Color(0xFF718096),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: _getPriorityColor(request['priority'])
                          .withOpacity(0.1),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      request['priority'],
                      style: TextStyle(
                        fontSize: 10,
                        color: _getPriorityColor(request['priority']),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 4),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // View Button
                    Container(
                      height: 28,
                      margin: const EdgeInsets.only(right: 8),
                      child: IconButton(
                        onPressed: () => _viewTestRequest(request),
                        icon: const Icon(
                          Icons.visibility,
                          size: 14,
                          color: Color(0xFF38A169),
                        ),
                        style: IconButton.styleFrom(
                          padding: const EdgeInsets.all(6),
                          backgroundColor:
                              const Color(0xFF38A169).withOpacity(0.1),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6),
                            side: BorderSide(
                              color: const Color(0xFF38A169).withOpacity(0.3),
                              width: 1,
                            ),
                          ),
                        ),
                      ),
                    ),

                    // Download Button
                    Container(
                      height: 28,
                      margin: const EdgeInsets.only(right: 8),
                      child: IconButton(
                        onPressed: () => _downloadTestReport(request),
                        icon: const Icon(
                          Icons.download,
                          size: 14,
                          color: Color(0xFF2383E2),
                        ),
                        style: IconButton.styleFrom(
                          padding: const EdgeInsets.all(6),
                          backgroundColor:
                              const Color(0xFF2383E2).withOpacity(0.1),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6),
                            side: BorderSide(
                              color: const Color(0xFF2383E2).withOpacity(0.3),
                              width: 1,
                            ),
                          ),
                        ),
                      ),
                    ),

                    // Call Button
                    Container(
                      height: 28,
                      child: IconButton(
                        onPressed: () => _callPatient(request),
                        icon: const Icon(
                          Icons.call,
                          size: 14,
                          color: Color(0xFFED8936),
                        ),
                        style: IconButton.styleFrom(
                          padding: const EdgeInsets.all(6),
                          backgroundColor:
                              const Color(0xFFED8936).withOpacity(0.1),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6),
                            side: BorderSide(
                              color: const Color(0xFFED8936).withOpacity(0.3),
                              width: 1,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }

  Color _getPriorityColor(String priority) {
    switch (priority) {
      case 'Urgent':
        return const Color(0xFFF56565);
      case 'Routine':
        return const Color(0xFF38A169);
      default:
        return const Color(0xFF718096);
    }
  }

  Color _getStatusColor(String status) {
    switch (status) {
      case 'Completed':
        return const Color(0xFF38A169);
      case 'Waiting':
        return const Color(0xFFED8936);
      default:
        return const Color(0xFF718096);
    }
  }

  void _downloadTestReport(Map<String, dynamic> request) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Downloading report for ${request['testName']}'),
        backgroundColor: const Color(0xFF2383E2),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  void _callPatient(Map<String, dynamic> request) {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 350),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: const Color(0xFFED8936).withOpacity(0.1),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.call,
                    color: Color(0xFFED8936),
                    size: 24,
                  ),
                ),
                const SizedBox(height: 16),
                const Text(
                  'Calling Patient',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF2D3748),
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  request['patient'],
                  style: const TextStyle(
                    fontSize: 14,
                    color: Color(0xFF4A5568),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'Test: ${request['testName']}',
                  style: const TextStyle(
                    fontSize: 12,
                    color: Color(0xFF718096),
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(
                      child: OutlinedButton(
                        onPressed: () => Navigator.pop(context),
                        style: OutlinedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          side: const BorderSide(color: Color(0xFFE2E8F0)),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6),
                          ),
                        ),
                        child: const Text(
                          'Cancel',
                          style: TextStyle(
                            fontSize: 13,
                            color: Color(0xFF718096),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content:
                                  Text('Call ended with ${request['patient']}'),
                              backgroundColor: const Color(0xFF38A169),
                              duration: const Duration(seconds: 2),
                              behavior: SnackBarBehavior.floating,
                              margin: const EdgeInsets.all(16),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFED8936),
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6),
                          ),
                        ),
                        child: const Text(
                          'End Call',
                          style: TextStyle(
                            fontSize: 13,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _viewTestRequest(Map<String, dynamic> request) {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 400),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Test Request Details',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF2D3748),
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.close, size: 20),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                _buildDetailRow('Test Name:', request['testName']),
                _buildDetailRow('Category:', request['category']),
                _buildDetailRow('Patient:', request['patient']),
                _buildDetailRow('Date:', request['date']),
                _buildDetailRow('Priority:', request['priority']),
                _buildDetailRow('Status:', request['status']),
                const SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () => Navigator.pop(context),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF2383E2),
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6),
                      ),
                    ),
                    child: const Text('Close'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 100,
            child: Text(
              label,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Color(0xFF4A5568),
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(
                fontSize: 14,
                color: Color(0xFF2D3748),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatsCards(bool isMobile, bool isTablet) {
    final statsData = [
      {
        'title': 'Total patients',
        'value': '12',
        'icon': Icons.people_outline,
        'gradient': const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFF59BDFF), Color(0xFFF1FAFF)],
        ),
      },
      {
        'title': 'Completed',
        'value': '8',
        'icon': Icons.check_circle_outline,
        'gradient': const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFF57E3D8), Color(0xFFE3FCFA)],
        ),
      },
      {
        'title': 'In-waiting',
        'value': '4',
        'icon': Icons.access_time,
        'gradient': const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFF50FFFF), Color(0xFFDFFFFF)],
        ),
      },
      {
        'title': 'Cancelled',
        'value': '0',
        'icon': Icons.cancel_outlined,
        'gradient': const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFF68EF77), Color(0xFFECFEEE)],
        ),
      },
    ];

    if (isMobile) {
      return Column(
        children: statsData.map((stat) {
          return Container(
            margin: const EdgeInsets.only(bottom: 10),
            child: _buildStatCard(
              title: stat['title'] as String,
              value: stat['value'] as String,
              icon: stat['icon'] as IconData,
              gradient: stat['gradient'] as Gradient,
              isMobile: true,
            ),
          );
        }).toList(),
      );
    }

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: isTablet ? 2 : 4,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: isTablet ? 1.8 : 2.0,
      ),
      itemCount: statsData.length,
      itemBuilder: (context, index) {
        final stat = statsData[index];
        return _buildStatCard(
          title: stat['title'] as String,
          value: stat['value'] as String,
          icon: stat['icon'] as IconData,
          gradient: stat['gradient'] as Gradient,
          isMobile: false,
        );
      },
    );
  }

  Widget _buildStatCard({
    required String title,
    required String value,
    required IconData icon,
    required Gradient gradient,
    required bool isMobile,
  }) {
    return GestureDetector(
      onTap: () {
        // Navigation logic here if needed
      },
      child: Container(
        padding: EdgeInsets.all(isMobile ? 12 : 16),
        decoration: BoxDecoration(
          gradient: gradient,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: isMobile ? 32 : 36,
                  height: isMobile ? 32 : 36,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child:
                      Icon(icon, color: Colors.white, size: isMobile ? 16 : 20),
                ),
                Icon(Icons.arrow_forward_ios,
                    color: Colors.white.withOpacity(0.8),
                    size: isMobile ? 12 : 14),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  value,
                  style: TextStyle(
                    fontSize: isMobile ? 20 : 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  title,
                  style: TextStyle(
                    fontSize: isMobile ? 11 : 12,
                    color: Colors.white.withOpacity(0.9),
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _deleteSelectedTests() {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 400),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(
                  Icons.warning,
                  size: 48,
                  color: Color(0xFFF56565),
                ),
                const SizedBox(height: 16),
                const Text(
                  'Delete Multiple Tests',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF2D3748),
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'This will delete all selected test requests. This action cannot be undone.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14,
                    color: Color(0xFF718096),
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(
                      child: OutlinedButton(
                        onPressed: () => Navigator.pop(context),
                        style: OutlinedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6),
                          ),
                          side: const BorderSide(color: Color(0xFFE2E8F0)),
                        ),
                        child: const Text(
                          'Cancel',
                          style: TextStyle(color: Color(0xFF718096)),
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Multiple test requests deleted'),
                              backgroundColor: Color(0xFF38A169),
                              duration: const Duration(seconds: 2),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFF56565),
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6),
                          ),
                        ),
                        child: const Text('Delete All'),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _showAddTestRequestForm() {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 500),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Add New Test Request',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF2D3748),
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.close, size: 20),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                const Text(
                    'Add new test request form would be implemented here'),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(
                      child: OutlinedButton(
                        onPressed: () => Navigator.pop(context),
                        style: OutlinedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6),
                          ),
                          side: const BorderSide(color: Color(0xFFE2E8F0)),
                        ),
                        child: const Text(
                          'Cancel',
                          style: TextStyle(color: Color(0xFF718096)),
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('New test request added'),
                              backgroundColor: Color(0xFF38A169),
                              duration: const Duration(seconds: 2),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF2383E2),
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6),
                          ),
                        ),
                        child: const Text('Add Request'),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
