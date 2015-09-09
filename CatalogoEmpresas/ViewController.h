//
//  ViewController.h
//  CatalogoEmpresas
//
//  Created by Fabricio Nogueira dos Santos on 9/8/15.
//  Copyright (c) 2015 Fabricio Nogueira. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController{
    NSMutableArray *catalogo;
}

@property (weak, nonatomic) IBOutlet UITextField *nomeField;
@property (weak, nonatomic) IBOutlet UITextField *quantidadeField;
@property (weak, nonatomic) IBOutlet UILabel *avisoSucessoLabel;
- (IBAction)incrementadorAlterado:(id)sender;
- (IBAction)salvar:(id)sender;

@end
