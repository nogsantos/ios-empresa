//
//  ViewController.m
//  CatalogoEmpresas
//
//  Created by Fabricio Nogueira dos Santos on 9/8/15.
//  Copyright (c) 2015 Fabricio Nogueira. All rights reserved.
//

#import "ViewController.h"
#import "Empresa.h"

@interface ViewController ()

@end

@implementation ViewController
/**
 * Inicialização da tela
 */
- (void)viewDidLoad {
    [super viewDidLoad];

    NSLog(@"Inicialização...");
    
    // mostra o teclado
    [self.nomeField becomeFirstResponder];
    
    // oculta o label de gravado com sucesso.
    self.avisoSucessoLabel.hidden = YES;

}
/**
 *
 */
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
/**
 * Método de ligação entre o incrementador e o campo
 */
- (IBAction)incrementadorAlterado:(id)sender {
    UIStepper *incrementador  = (UIStepper *) sender;
    self.quantidadeField.text = [NSString stringWithFormat:@"%d", (int) incrementador.value];
}
/**
 * Método para salvar
 */
- (IBAction)salvar:(id)sender {

    // libera o teclado
    [self.nomeField resignFirstResponder];
    
    Empresa *e = [[Empresa alloc]init];
    e.nome     = self.nomeField.text;
    e.quantidadeFuncionarios = [self.quantidadeField.text intValue];
    
//    NSLog(@"Empresa criada. Nome=%@, Funcionários=%d", e.nome, e.quantidadeFuncionarios);
    
    // ação salvar
    [self salvarEmpresa:e];
    // impressão no log
    [self mostraCatalogo];
    // limpar campos da tela
    [self limpaCampos];
    // testes
    [self teste:@"teste" withRange:@"teste2" withArray:@"teste 3" withInteger:1];
    // Mostra e oculta a messagem de sucesso ao salvar os dados.
    [self sucessMessage];
    
    
}
/**
 * Método salvar
 * @param Empresa
 */
-(void) salvarEmpresa:(Empresa *) novaEmpresa{
    if(!catalogo){
        catalogo = [[NSMutableArray alloc] init];
    }
    [catalogo addObject:novaEmpresa];
}
/**
 * Imprime no log os dados salvos
 */
-(void) mostraCatalogo{
    NSLog(@"******* Listando todas as empresas *******");
    
    for (Empresa *empresa in catalogo) {
        NSLog(@"A empresa %@ tem %d funcionários", empresa.nome, empresa.quantidadeFuncionarios);
    }
}
/**
 * Método para limpar os campos da tela
 */
-(void)limpaCampos{
    self.nomeField.text       = nil;
    self.quantidadeField.text = @"0";
}
/**
 * Método para testes
 */
-(void)teste:(NSString *) st
    withRange:(NSString *) mrange
    withArray:(NSString *) marray
    withInteger:(int) mit{
    
    NSLog(@"Valores: %@ %@ %@ %i", st, mrange, marray, mit);
    
}
/**
 * Método que mostra ou esconde a mensagem de sucesso ao persistir os dados.
 */
-(void) sucessMessage{
    self.avisoSucessoLabel.alpha = 0;
    
    [UIView animateWithDuration:1 animations:^{
        self.avisoSucessoLabel.hidden = NO;
        self.avisoSucessoLabel.alpha  = 1;
        
    }completion:^(BOOL finished) {
        [UIView animateWithDuration:1 delay:2 options:0 animations:^{
            self.avisoSucessoLabel.alpha = 0;
        }completion:^(BOOL finished) {
            self.avisoSucessoLabel.hidden = YES;
        }];
    }];
}


@end
