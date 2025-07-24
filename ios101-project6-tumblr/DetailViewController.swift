import UIKit
import NukeExtensions

class DetailViewController: UIViewController {
    var post: Post! // Ensure this is set before use

    @IBOutlet weak var postImageView: UIImageView!
    @IBOutlet weak var summaryLabel: UILabel!
    @IBOutlet weak var captionTextView: UITextView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Display the summary and caption (trim HTML if needed)
        summaryLabel.text = post.summary
        captionTextView.text = post.caption.trimHTMLTags() ?? post.caption
        // Load the first image
        if let photo = post.photos.first {
            let url = photo.originalSize.url
            NukeExtensions.loadImage(with: url, into: postImageView)
        }
        self.title = "Post Details"
    }
}
