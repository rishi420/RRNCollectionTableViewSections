![](http://i.imgur.com/ZIjeYsF.gif)

# Requirements

XCode 6.4+, iOS 8.1+

# Installation

In XCode, select 'Add Files To Project', and select the following

RRNCollectionTableViewSectionItemProtocol.h
RRNCollectionTableViewCellProtocol.h
RRNCollectionTableViewCellDatasourceProtocol.h
RRNCollectionViewController.h
RRNCollectionViewController.m
RRNCollectionTableViewCell.h
RRNCollectionTableViewCell.m
RRNTableCollectionViewController.h
RRNTableCollectionViewController.m

# Usage

1. Build a UITableView, either in code or from interface builder.
2. Build a cell for your tableView which is a subclass of RRNCollectionTableViewCell.
3. Subclass RRNTableCollectionViewController.
 * Override model and return a pointer to your model. Your modal should be an array of objects, each of which conform to RRNCollectionTableViewSectionItem Protocol.

See the 'Example' project for a demonstration.

License

RRNCollectionTableViewSections is released under the MIT license. See 'LICENCE' for details.